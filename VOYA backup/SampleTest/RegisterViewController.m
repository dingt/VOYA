//
//  RegisterViewController.m
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import "RegisterViewController.h"
#import "SBJson.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize CancleButton,SubmitButton;
@synthesize UserName,Password,RePassword;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];

	// Do any additional setup after loading the view.
}
-(void)viewTapped:(UITapGestureRecognizer*)tap{
    [self.UserName resignFirstResponder];
    [self.Password resignFirstResponder];
    [self.RePassword resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)CancleButtonClick:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)SubmitButtonClick:(id)sender{
    @try {
        
        if([[UserName text] isEqualToString:@""] || [[Password text] isEqualToString:@""] || [[RePassword text] isEqualToString:@""]) {
            [self alertStatus:@"Please enter both Username and Password" :@"Register Failed!"];
        }else if(![[Password text] isEqualToString:[RePassword text]]){
            [self alertStatus:@"Different password" :@"Register Faild"];
        }
        else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[UserName text],[Password text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://www.beyoutoo.net/register.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %d", [response statusCode]);
            if ([response statusCode] >=200 && [response statusCode] <300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"%@",jsonData);
                NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                NSLog(@"%d",success);
                if(success == 1)
                {
                    NSLog(@"Register SUCCESS");
                    [self alertStatus:@"Register Successfully." :@"Register Success!"];
                    
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Register Failed! username might be used"];
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Register Failed!"];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Register Failed." :@"Register Failed!"];
    }

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
        if (textField == self.UserName) {
            [self.UserName resignFirstResponder];
            [self.Password becomeFirstResponder];
            return NO;
        }else if (textField == self.Password){
            [self.Password resignFirstResponder];
        [self.RePassword becomeFirstResponder];
        return NO;
    }

    return YES;
}

int prewTag ;
float prewMoveY;  
-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFrame =  textField.frame;
    float textY = textFrame.origin.y+textFrame.size.height;
    float bottomY = self.view.frame.size.height-textY;
    if(bottomY>=216)
    {
        prewTag = -1;
        return;
    }
    prewTag = textField.tag;
    float moveY = 216-bottomY;
    prewMoveY = moveY;
    
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -=moveY;
    frame.size.height +=moveY;
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if(prewTag == -1)
    {
        return;
    }
    float moveY ;
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    if(prewTag == textField.tag)     {
        moveY =  prewMoveY;
        frame.origin.y +=moveY;
        frame.size. height -=moveY;
        self.view.frame = frame;
    }
   
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    
}

//alert message
- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
    [alertView show];
}

@end
