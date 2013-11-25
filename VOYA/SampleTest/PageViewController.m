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
#import "xmlElement.h"

@interface PageViewController ()


@property(nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) xmlElement *rootElement;

@property (nonatomic, strong) xmlElement *currentElementPointer;

@end

@implementation PageViewController

@synthesize URLTextField ;
@synthesize pageWebView ;
@synthesize activityItem;
@synthesize toolBar;
@synthesize smallerFontBarButton,largerFontBarButton,settingBarButton;

@synthesize xmlParser, rootElement, currentElementPointer;
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
- (void)largerFontBarButtonClick:(UIBarButtonItem *)sender {
    
    
}
- (void)smallFontBarButtonClick:(UIBarButtonItem *)sender {
    
    
}

- (void)settingButtonClick:(UIBarButtonItem *)sender {
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
   
	//add by linxiaolan
	
	self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:(NSURL *)url];
    [self.xmlParser setDelegate:self];
    [self.xmlParser setShouldProcessNamespaces:NO];
    [self.xmlParser setShouldReportNamespacePrefixes:NO];
    [self.xmlParser setShouldResolveExternalEntities:NO];
    if([self.xmlParser parse]) {
        NSLog(@"the xml is parsed.");
        xmlElement *element = self.rootElement.subElement[1];
        NSLog(@"%@", element.subElement);
    }
    else {
        NSLog(@"failed to parse the xml");
    }
    
    

    //add end
    
   // self.pageWebView.scrollView.scrollEnabled=YES;
   // self.pageWebView.scrollView.bounces=YES;
   // self.pageWebView.scrollView.zooming = YES;

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    largerFontBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"A" style:UIBarButtonItemStyleBordered target:self action:@selector(largerFontBarButtonClick:)] autorelease];
    smallerFontBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"a" style:UIBarButtonItemStyleBordered target:self action:@selector(smallFontBarButtonClick:)] autorelease];
//    settingBarButton=[[[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStyleBordered target:self action:@selector(settingButtonClick:)] autorelease];
    UIBarItem* space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
						 UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    toolBar = [[[UIToolbar alloc] initWithFrame:CGRectZero] autorelease];
	toolBar.tintColor = [UIColor blueColor];
	NSArray *toolItems=[NSArray arrayWithObjects:smallerFontBarButton,space,
                        largerFontBarButton,space,
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
    [URLTextField release];
    [pageWebView release];
    [_goButton release];
    [xmlParser release];
    [rootElement release];
    [currentElementPointer release];
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

// add by lxl

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if(self.rootElement == nil)
    {
        self.rootElement = [[xmlElement alloc] init];
        self.currentElementPointer = self.rootElement;
    }
    else {
        xmlElement *newElement = [[xmlElement alloc] init];
        newElement.parent = self.currentElementPointer;
        [self.currentElementPointer.subElement addObject:newElement];
        self.currentElementPointer = newElement;
    }
    
    self.currentElementPointer.name = elementName;
    self.currentElementPointer.attributes = attributeDict;
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if([self.currentElementPointer.text length] > 0)
    {
        self.currentElementPointer.text = [self.currentElementPointer.text stringByAppendingString:string];
        
    }
    else {
        self.currentElementPointer.text = string;
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.currentElementPointer = self.currentElementPointer.parent;
}

-(void) parserDidEndDocument:(NSXMLParser *)parser
{
    self.currentElementPointer = nil;
}

-(void) parserDidStartDocument:(NSXMLParser *)parser
{
    self.rootElement = nil;
    self.currentElementPointer = nil;
}

// add end


@end
