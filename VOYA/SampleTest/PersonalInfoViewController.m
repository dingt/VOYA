//
//  PersonalInfoViewController.m
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "SBJson.h"
#import "VOYAData.h"

@interface PersonalInfoViewController ()
{
    NSString *firstname;
    NSString *lastname;
    NSString *email;
    NSString *gender;
    NSString *location;
    
    NSString *currentusername;

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

@synthesize personalPageView = _personalPageView;


-(void)getPersonalInfoFromServer
{

    //VOYAData *username = [VOYAData getCurrentUserName];
    @try {
        
        NSString *post = [[NSString alloc] initWithFormat:@"username=%@",currentusername];
        NSLog(@"PostData: %@", post);
        
        NSURL *url = [NSURL URLWithString:@"http://www.beyoutoo.net/getinfo.php"];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
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
            NSLog(@"jasonData=%@", jsonData);
            NSLog(@"Get Prersonal Information SUCCESS");
            
            [self.firstnameTextField setText:(NSString *) [jsonData objectForKey:@"firstname"]];
            [self.lastnameTextField setText:(NSString *) [jsonData objectForKey:@"lastname"]];
            [self.emailTextField setText:(NSString *) [jsonData objectForKey:@"email"]];
            [self.genderTextField setText:(NSString *) [jsonData objectForKey:@"gender"]];
            [self.locationTextField setText:(NSString *) [jsonData objectForKey:@"location"]];
            
            firstname = [self.firstnameTextField text];
            lastname =[self.lastnameTextField text];
            email = [self.emailTextField text];
            gender = [self.genderTextField text];
            location = [self.locationTextField text];
            
            [[self navigationItem] setTitle:currentusername];
            
            NSLog(@"%@", firstname);
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
   // [self.navigationItem setHidesBackButton:YES];
    //get personal info
    
    VOYAData *username = [VOYAData getCurrentUserName];
    
    currentusername = [username currentUserName];
    self.title=currentusername;
      // [[self navigationItem] setTitle:username.currentUserName];
    
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
    
    [self getPersonalInfoFromServer];

    
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
    firstname = [self.firstnameTextField text];
    lastname = [self.lastnameTextField text];
    email = [self.emailTextField text];
    gender = [self.genderTextField text];
    location = [self.locationTextField text];
    
   @try {
       //NSString *currentusername = [user currentUserName];
       
       NSString *post = [[NSString alloc] initWithFormat:@"username=%@&firstname=%@&lastname=%@&email=%@&gender=%@&location=%@",currentusername,
                         firstname, lastname, email, gender, location];
       NSLog(@"PostData: %@", post);
       
       NSURL *url = [NSURL URLWithString:@"http://www.beyoutoo.net/updateinfo.php"];
       NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
       NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
       
       NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
       [request setURL:url];
       [request setHTTPMethod:@"POST"];
       [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
       [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
       [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
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
           NSLog(@"jasonData=%@", jsonData);
           NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
           NSLog(@"%d",success);
           if(success == 1)
           {
               NSLog(@"Update SUCCESS");
               [self alertStatus:@"Update Personal Information Successfully." :@"Update Success!"];
               
           } else {
               
               NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
               [self alertStatus:error_msg :@"Update Failed!"];
           }
       }

       
       
       
    }
    @catch (NSException *e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"" :@""];
    }
    
    
    // tell client that their operation is updated.
    //[self alertStatus:@"Your information has been saved." :@"Update Information"];
    
    
}
- (IBAction)logoutButtonClick:(UIButton *)sender {

    @try {
        //NSString *currentusername = [user currentUserName];
        
        NSString *post = [[NSString alloc] initWithFormat:@"username=%@",currentusername];
        NSLog(@"PostData: %@", post);
        
        NSURL *url = [NSURL URLWithString:@"http://www.beyoutoo.net/logout.php"];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
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
            NSLog(@"jasonData=%@", jsonData);
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            NSLog(@"%d",success);
            if(success == 1)
            {
                NSLog(@"Logout SUCCESS");
                [self alertStatus:@"Logout Successfully." :@"Logout Success!"];
                
                
            } else {
                
                NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                [self alertStatus:error_msg :@"Update Failed!"];
            }
        }     
        
    }
    @catch (NSException *e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"" :@""];
    }
    
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
    [_personalPageView release];
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
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
    [alertView show];
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isLogin"];
    [self.navigationController popToRootViewControllerAnimated:NO];

}
@end
