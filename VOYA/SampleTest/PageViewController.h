//
//  PageViewController.h
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController


@property (retain, nonatomic) IBOutlet UITextField *urlTextField;

@property (retain, nonatomic) IBOutlet UIWebView *pageWebView;

@property (retain, nonatomic) IBOutlet UIButton *goButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *smallerFontBarButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *largerFontBarButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *settingBarButton;

@end
