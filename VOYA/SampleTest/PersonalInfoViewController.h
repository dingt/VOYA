//
//  PersonalInfoViewController.h
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoViewController : UIViewController
<UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UIButton *backButton;

@property (retain, nonatomic) IBOutlet UIButton *editButton;

@property (retain, nonatomic) IBOutlet UIButton *submitButton;

@property (retain, nonatomic) IBOutlet UIButton *cancelButton;

@property (retain, nonatomic) IBOutlet UIButton *logoutButton;

@property (retain, nonatomic) IBOutlet UITextField *firstnameTextField;

@property (retain, nonatomic) IBOutlet UITextField *lastnameTextField;

@property (retain, nonatomic) IBOutlet UITextField *emailTextField;

@property (retain, nonatomic) IBOutlet UITextField *genderTextField;

@property (retain, nonatomic) IBOutlet UITextField *locationTextField;

@property (retain, nonatomic) IBOutlet UITextView *personalPageView;


@end
