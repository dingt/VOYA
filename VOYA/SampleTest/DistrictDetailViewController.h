//
//  DistrictDetailViewController.h
//  VOYA
//
//  Created by Eva Lin on 11/28/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DistrictDetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *queryTextField;

@property (retain, nonatomic) IBOutlet UIButton *queryButton;

@property (retain, nonatomic) IBOutlet UITextView *resultTextView;

@property (retain, nonatomic) IBOutlet UISegmentedControl *queryOption;


@end
