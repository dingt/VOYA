//
//  SeeDetailViewController.m
//  VOYA
//
//  Created by Eva Lin on 11/28/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "SeeDetailViewController.h"
#import "NorthwindEntities.h"

@interface SeeDetailViewController ()

@end

@implementation SeeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)queryButtonClick:(UIButton *)sender {
    
    @try {
        NSString *querystring = self.textField.text;
        NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
        NSString *search;
        if (self.optionSegment.selectedSegmentIndex == 0)
        {
            search = [[NSString alloc] initWithFormat:@"See(%@)", querystring];
        }
        if (self.optionSegment.selectedSegmentIndex == 1)
        {
            search = [[NSString alloc] initWithFormat:@"See?$filter=name eq '%@'", querystring];
        }
        if (self.optionSegment.selectedSegmentIndex == 2)
        {
            search = [[NSString alloc] initWithFormat:@"See?$filter=cityname eq '%@'", querystring];
        }
        
        QueryOperationResponse *response = [proxy execute:search];
        NSMutableArray *array = [response getResult];
        
        self.textView.text = @"";
        
        for (NorthwindModel_See *obj in array)
        {
            NSMutableString *text = [[NSMutableString alloc] initWithString:self.textView.text];
            NSLog(@"%@", [obj getid]);
            NSString *seeId = [[NSString alloc] initWithFormat:@"Place Id : %@ \n",[obj getid]];
            NSString *seeName = [[NSString alloc] initWithFormat:@"Place Name : %@ \n",[obj getplaceName]];
            NSString *seeCityName = [[NSString alloc] initWithFormat:@"Place City Name : %@ \n",[obj getcityName]];
            NSString *seeIntro = [[NSString alloc] initWithFormat:@"Place Introduction : %@ \n",[obj getintro]];
            [text appendString:seeId];
            [text appendString:seeName];
            [text appendString:seeCityName];
            [text appendString:seeIntro];
            self.textView.text = text;
        }
        
    }
    @catch (NSException *e) {
        NSLog(@"Exception: %@", e);
        self.textField.text = @"Bad Input";
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_optionSegment release];
    [_textField release];
    [_queryButton release];
    [_textView release];
    [super dealloc];
}
@end
