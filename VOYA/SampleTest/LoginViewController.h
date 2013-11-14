//
//  LoginViewController.h
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain)IBOutlet UITextField*
UserName;
@property (nonatomic,retain)IBOutlet UITextField *Password;
@property (nonatomic,retain)IBOutlet UIButton *LoginButton;
@property (nonatomic,retain)IBOutlet UIButton *
CancleButton;
@property (nonatomic,retain)IBOutlet UIButton *RegisterButton;
-(IBAction)CancleButtonClick:(id)sender;
-(IBAction)LoginButtonClick:(id)sender;
@end
