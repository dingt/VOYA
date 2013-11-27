//
//  PageViewController.m
//  SampleTest
//
//  Created by Eva Lin on 11/14/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "PageViewController.h"
#import "PersonalInfoViewController.h"
#import "VOYAData.h"
#import "NorthwindEntities.h"
#import "OdataViewController.h"
#import "MapViewController.h"
@interface PageViewController ()


@end

@implementation PageViewController

@synthesize URLTextField ;
@synthesize pageWebView ;
@synthesize activityItem;
@synthesize toolBar;
@synthesize showMoreBarButton,navigationBarButton,settingBarButton;

//@synthesize cityLabel = _cityLabel;
//
//- (void)setCityLabel:(NSString *)cityLabel
//{
//    _cityLabel = cityLabel;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)goPageView:(UIButton *)sender {
    
    NSURL *url = [[NSURL alloc] initWithString:self.URLTextField.text];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.pageWebView loadData:urlData MIMEType:@"text/stylesheet" textEncodingName:@"URF-8" baseURL:[NSURL URLWithString:@""]];
    });
}

- (IBAction)urlRequest:(UITextField *)sender {
    
    //[self.pageWebView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    
}

- (IBAction)showmoreItemClicked:(id )sender {
    
    OdataViewController *odata = [[OdataViewController alloc] init];
    [self.navigationController pushViewController:odata animated:YES];
    [odata release];
    
}
- (IBAction)navigationItemClicked:(id)sender {
    MapViewController *mapViewController=[[MapViewController alloc] init];
    [self.navigationController pushViewController:mapViewController animated:YES];
    [mapViewController release];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"mapView"])
    {
        [[segue destinationViewController] setTitle:self.title];
    }
}

- (IBAction)settingButtonDidClick:(UIBarButtonItem *)sender {
    PersonalInfoViewController *info=[[PersonalInfoViewController alloc] init];
    [self.navigationController pushViewController:info animated:YES];
    [info release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.URLTextField.delegate=self;
    NSString *city = self.title;
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CityList" ofType:@"plist"]];
    NSURL *url = [dict objectForKey:city];
    self.URLTextField.text = (NSString *)url;
    UIActivityIndicatorView* spinner =
    [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
      UIActivityIndicatorViewStyleWhite] autorelease];
	[spinner startAnimating];
	activityItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
   

    //add test for odata query
    NSLog(@"begin");
    NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
    //NSString *searchCity = [[NSString alloc] initWithFormat:@"City?$filter=name eq '%@'" ,city];
    QueryOperationResponse *response = [proxy execute:[dict objectForKey:city]];
    NSMutableArray *citiesArray  = [response getResult];
    NorthwindModel_City* city1 = [citiesArray objectAtIndex:0];
    NSLog(@"City Name = %@ \n City URL = %@", [city1 getname], [city1 geturl]);
    URLTextField.text = [city1 geturl];
    
   // self.pageWebView.scrollView.scrollEnabled=YES;
   // self.pageWebView.scrollView.bounces=YES;
   // self.pageWebView.scrollView.zooming = YES;

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    navigationBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"Navigation" style:UIBarButtonItemStyleBordered target:self action:@selector(navigationItemClicked:)] autorelease];
//    showMoreBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"More" style:UIBarButtonItemStyleBordered target:self action:@selector(showmoreItemClicked:)] autorelease];    
   
//    settingBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStyleBordered target:self action:@selector(settingButtonClick:)] autorelease];
    UIBarItem* space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
						 UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    toolBar = [[[UIToolbar alloc] initWithFrame:CGRectZero] autorelease];
	toolBar.tintColor = [UIColor blueColor];
	NSArray *toolItems=[NSArray arrayWithObjects:navigationBarButton,space,
                        showMoreBarButton,space,
                        settingBarButton,
                        nil ];
	[toolBar setItems:toolItems animated:NO];
    
    // just for test
  //   NSURL *url;
   // if([self.urlString length]==0)
  //     url = [NSURL URLWithString:@"http://www.google.com"];
//    else{
 //      url = [NSURL URLWithString:self.urlString];
   // }
    NSURL *url = [[NSURL alloc] initWithString:self.URLTextField.text];
    
    pageWebView=[[UIWebView alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [pageWebView loadRequest:request];
    [pageWebView setDelegate:self];
    CGRect rootViewBounds = self.navigationController.view.bounds;
	CGFloat rootViewHeight = CGRectGetHeight(rootViewBounds);
	CGFloat rootViewWidth = CGRectGetWidth(rootViewBounds);
		if ( UIInterfaceOrientationIsLandscape(self.interfaceOrientation) == YES) {
            [pageWebView setFrame:CGRectMake(0, 60, rootViewWidth, rootViewHeight - 44 - 32)];
           
            [toolBar setFrame:CGRectMake(0, rootViewHeight - 32, rootViewWidth, 32)];
        } else {
            if(rootViewHeight>480)
            [pageWebView setFrame:CGRectMake(0, 60, rootViewWidth,400)];
           else
             [pageWebView setFrame:CGRectMake(0, 60, rootViewWidth,320)];
            [toolBar setFrame:CGRectMake(0, rootViewHeight - 44, rootViewWidth, 44)];
        }
    [self.navigationController.view addSubview:toolBar];
     [self.view addSubview:pageWebView];

}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"showMore"])
//    {
//        [[segue destinationViewController] setTitle:self.title];
//    }
//}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [toolBar removeFromSuperview];
    toolBar=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [showMoreBarButton release];
    [navigationBarButton release];
    [URLTextField release];
    [pageWebView release];
    [_goButton release];
    [settingBarButton release];
    [super dealloc];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (![URLTextField.text isEqualToString:@""] ) {
		[textField resignFirstResponder];
		NSRange range = [textField.text rangeOfString:@"://"];
		if (range.location == NSNotFound) {
			NSLog(@":// NSNotFound");
			textField.text = [NSString stringWithFormat:@"http://%@", textField.text];
			 
		} else {
			NSLog(@":// NSFound");
		 
		}
        NSString *tempString = textField.text;
        while ([tempString hasSuffix:@" "]) {
            tempString = [tempString substringToIndex:(tempString.length-1)];
        }
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:tempString]];
        NSLog(@"%@",request);
        [pageWebView loadRequest:request];
	}
    return YES;
}

#pragma mark -
#pragma mark UIWebViewDelegate



- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request
 navigationType:(UIWebViewNavigationType)navigationType {


    if ( navigationType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
       
    }
   	 	return YES;
}
- (void)webViewDidStartLoad:(UIWebView*)webView {
	
	self.title = NSLocalizedString(@"Loading...", @"");
	
	if (!self.navigationItem.rightBarButtonItem) {
		[self.navigationItem setRightBarButtonItem:activityItem animated:YES];
		[(UIActivityIndicatorView *)activityItem.customView startAnimating];
	}
	[(UIActivityIndicatorView *)activityItem.customView startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
	
	self.title = [pageWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
	
	if (self.navigationItem.rightBarButtonItem == activityItem) {
		
		[(UIActivityIndicatorView *)activityItem.customView stopAnimating];
		
	}
	
	
	self.urlString = [pageWebView stringByEvaluatingJavaScriptFromString:@"document.URL"];
	
	if (!(URLTextField.editing)) {
		URLTextField.text = [pageWebView stringByEvaluatingJavaScriptFromString:@"document.URL"];
		
	}

	NSLog(@"finish load.");
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
    [alterview release];
}


@end
