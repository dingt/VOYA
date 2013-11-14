//
//  RegisterViewController.h
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain)IBOutlet UITextField*
UserName;
@property (nonatomic,retain)IBOutlet UITextField *Password;
@property (nonatomic,retain)IBOutlet UITextField *RePassword;
@property (nonatomic,retain)IBOutlet UIButton *
CancleButton;
@property (nonatomic,retain)IBOutlet UIButton *SubmitButton;
-(IBAction)CancleButtonClick:(id)sender;
-(IBAction)SubmitButtonClick:(id)sender;

@end
