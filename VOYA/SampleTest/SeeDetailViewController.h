//
//  SeeDetailViewController.h
//  VOYA
//
//  Created by Eva Lin on 11/28/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeeDetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet UISegmentedControl *optionSegment;

@property (retain, nonatomic) IBOutlet UITextField *textField;

@property (retain, nonatomic) IBOutlet UIButton *queryButton;

@property (retain, nonatomic) IBOutlet UITextView *textView;

@end
