//
//  PageViewController.h
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PageViewController : UIViewController
<UITextFieldDelegate,UIWebViewDelegate, NSXMLParserDelegate>

@property (retain, nonatomic) IBOutlet UITextField *URLTextField;

//@property (nonatomic, strong) NSString *cityLabel;

@property (retain, nonatomic) UIWebView * pageWebView;

@property (retain, nonatomic) IBOutlet UIButton *goButton;

@property (retain, nonatomic) UIBarButtonItem *smallerFontBarButton;

@property (retain, nonatomic)  UIBarButtonItem *largerFontBarButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *settingBarButton;
@property(nonatomic,retain)UIToolbar *toolBar;
// for http request
@property (nonatomic,retain)NSString* urlString;
@property(nonatomic,retain)UIBarButtonItem *activityItem;


@end
