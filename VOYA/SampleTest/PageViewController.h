//
//  PageViewController.h
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NorthwindEntities.h"

@interface PageViewController : UIViewController
<UITextFieldDelegate,UIWebViewDelegate, NSXMLParserDelegate>

@property (retain, nonatomic) IBOutlet UITextField *URLTextField;

//@property (nonatomic, strong) NSString *cityLabel;

@property (retain, nonatomic) UIWebView * pageWebView;

@property (retain, nonatomic) IBOutlet UIButton *goButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *showMoreBarButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *navigationBarButton;
@property(nonatomic,retain)UIToolbar *toolBar;
// for http request
@property (nonatomic,retain)NSString* urlString;
@property(nonatomic,retain)UIBarButtonItem *activityItem;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *settingBarButton;


@end
