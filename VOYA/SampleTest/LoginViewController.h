//
//  LoginViewController.h
//  SampleTest
//
//  Created by CHIRU on 13-11-14.
//  Copyright (c) 2013年 CHIRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property BOOL *isLogin;
@property (nonatomic,retain)IBOutlet UITextField*
UserName;
@property (nonatomic,retain)IBOutlet UITextField *Password;
@property (nonatomic,retain)IBOutlet UIButton *LoginButton;
@property (nonatomic,retain)IBOutlet UIButton *
CancleButton;
@property (nonatomic,retain)IBOutlet UIButton *RegisterButton;
-(IBAction)CancleButtonClick:(id)sender;
-(IBAction)LoginButtonClick:(id)sender;


@end
