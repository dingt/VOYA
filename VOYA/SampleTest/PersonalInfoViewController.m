//
//  PersonalInfoViewController.m
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "SBJson.h"

@interface PersonalInfoViewController ()
{
    NSString *firstname;
    NSString *lastname;
    NSString *email;
    NSString *gender;
    NSString *location;
    
    NSString *username; //used to communicate with the server.
    NSString *password; //used to communicate with the server.
}

@end

@implementation PersonalInfoViewController

@synthesize firstnameTextField = _firstnameTextField;
@synthesize lastnameTextField = _lastnameTextField;
@synthesize emailTextField = _emailTextField;
@synthesize genderTextField = _genderTextField;
@synthesize locationTextField = _locationTextField;

@synthesize backButton = _backButton;
@synthesize cancelButton = _cancelButton;
@synthesize submitButton = _submitButton;
@synthesize logoutButton = _logoutButton;


-(void)getPersonalInfoFromServer
{
    @try {
        if ([username isEqualToString:@""] || [password isEqualToString:@""])
        {
            [self alertStatus:@"Cannot reach your personal account" :@"Connnect Error"];
        }
        else
        {
            NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@", username, password];
            NSLog(@"PostData: %@", post);
            
            NSURL *url = [NSURL URLWithString:@"http://localhost/xampp/jsongetPersonalInfo.php"];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSData *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-from-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code %d", [response statusCode]);
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                NSString *responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response = %@", responseData);
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"%@", jsonData);
                
                NSInteger *success =[(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                NSLog(@"%d", success);
                if(success == 1)
                {
                    NSLog(@"Get Prersonal Information SUCCESS");
                    firstname = [[NSString alloc] [(NSString *) [jsonData objectForKey:@"firstname"]]];
                    
                    lastname = [(NSString *) [jsonData objectForKey:@"lastname"]];
                    email = [(NSString *) [jsonData objectForKey:@"email"]];
                    gender = [(NSString *) [jsonData objectForKey:@"gender"] ];
                    
                }
            }
            
        }
    }
    @catch (NSExpression *e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Get PersonalInfo Failed" :@"Failed"];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewTapped:(UITapGestureRecognizer *)tap{
    
    [self.firstnameTextField resignFirstResponder];
    [self.lastnameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.genderTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:tap];
    
    [self.firstnameTextField.delegate self];
    [self.lastnameTextField.delegate self];
    [self.emailTextField.delegate self];
    [self.genderTextField.delegate self];
    [self.locationTextField.delegate self];
    
    [self.firstnameTextField setEnabled:NO];
    [self.lastnameTextField setEnabled:NO];
    [self.emailTextField setEnabled:NO];
    [self.genderTextField setEnabled:NO];
    [self.locationTextField setEnabled:NO];
    
    firstname = [self.firstnameTextField text];
    lastname = [self.lastnameTextField text];
    email = [self.emailTextField text];
    gender = [self.genderTextField text];
    location = [self.locationTextField text];
    
    //username = viewController
}

-(void)setUserName:(NSString *)str
{
    username = str;
}

-(IBAction)cancelButtonClick:(UIButton *)sender
{
   
    self.firstnameTextField.text = firstname;
    self.lastnameTextField.text = lastname;
    self.emailTextField.text = email;
    self.genderTextField.text = gender;
    self.locationTextField.text = location;
    [self.firstnameTextField setEnabled:NO];
    [self.lastnameTextField setEnabled:NO];
    [self.emailTextField setEnabled:NO];
    [self.genderTextField setEnabled:NO];
    [self.locationTextField setEnabled:NO];
    [self.submitButton setEnabled:NO];
    [self.cancelButton setEnabled:NO];
    
     //[self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}
- (IBAction)submitButtonClick:(UIButton *)sender {
    
/*    @try {
        
            
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"" :@""];
    }*/
    
    
    // tell client that their operation is updated.
    [self alertStatus:@"Your information has been saved." :@"Update Information"];
    
    
}
- (IBAction)logoutButtonClick:(UIButton *)sender {
    
    [self alertStatus:@"Are you srue to log out?" :@"Warning"];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_backButton release];
    [_editButton release];
    [_submitButton release];
    [_cancelButton release];
    [_logoutButton release];
    [_firstnameTextField release];
    [_lastnameTextField release];
    [_emailTextField release];
    [_genderTextField release];
    [_locationTextField release];
    [super dealloc];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    if (textField == self.firstnameTextField) {
        [self.firstnameTextField resignFirstResponder];
        [self.lastnameTextField becomeFirstResponder];
        return NO;
    }else if (textField == self.lastnameTextField){
        [self.lastnameTextField resignFirstResponder];
        [self.emailTextField becomeFirstResponder];
        return NO;
    }else if (textField == self.emailTextField) {
        [self.emailTextField resignFirstResponder];
        [self.genderTextField becomeFirstResponder];
        return NO;
    }else if (textField == self.genderTextField) {
        [self.genderTextField resignFirstResponder];
        [self.locationTextField becomeFirstResponder];
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
- (IBAction)editButtonClick:(UIButton *)sender {
    [self.submitButton setEnabled:YES];
    [self.cancelButton setEnabled:YES];
    
    [self.firstnameTextField setEnabled:YES];
    [self.lastnameTextField setEnabled:YES];
    [self.emailTextField setEnabled:YES];
    [self.genderTextField setEnabled:YES];
    [self.locationTextField setEnabled:YES];
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
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil, nil];
    [alertView show];
}

@end
