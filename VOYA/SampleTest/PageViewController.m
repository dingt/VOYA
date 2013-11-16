//
//  PageViewController.m
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

@synthesize urlTextField = _urlTextField;
@synthesize pageWebView = _pageWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)goPageView:(UIButton *)sender {
    
    NSURL *url = [[NSURL alloc] initWithString:self.urlTextField.text];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.pageWebView loadData:urlData MIMEType:@"text/stylesheet" textEncodingName:@"URF-8" baseURL:[NSURL URLWithString:@""]];
    });
}

- (IBAction)urlRequest:(UITextField *)sender {
    
    //[self.pageWebView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.urlTextField.delegate self];
   // self.pageWebView.scrollView.scrollEnabled=YES;
   // self.pageWebView.scrollView.bounces=YES;
   // self.pageWebView.scrollView.zooming = YES;

	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [_urlTextField release];
    [_pageWebView release];
    [_goButton release];
    [super dealloc];
}
@end
