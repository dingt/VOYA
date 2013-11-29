//
//  OdataViewController.h
//  VOYA
//
//  Created by Tongzu Ding on 11/25/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import "ViewController.h"
#import "NorthwindEntities.h"

@interface OdataViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *cityTextView;

@property (retain, nonatomic) IBOutlet UITextView *districtTextView;

@property (retain, nonatomic) IBOutlet UITextView *playTextView;

@property (retain, nonatomic) IBOutlet UITextView *seeTextView;

@property (retain, nonatomic) IBOutlet UIButton *districtDetailButton;

@property (retain, nonatomic) IBOutlet UIButton *playDetailButton;

@property (retain, nonatomic) IBOutlet UIButton *seeDetailButton;

@end
