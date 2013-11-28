//
//  DistrictDetailViewController.m
//  VOYA
//
//  Created by Eva Lin on 11/28/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "DistrictDetailViewController.h"
#import "NorthwindEntities.h"


@interface DistrictDetailViewController ()

@end

@implementation DistrictDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)queryButtonClick:(UIButton *)sender {
    
    @try {
        NSString *querystring = self.queryTextField.text;
        NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
        NSString *search;
        if (self.queryOption.selectedSegmentIndex == 0)
        {
            search = [[NSString alloc] initWithFormat:@"District(%@)", querystring];
        }
        if (self.queryOption.selectedSegmentIndex == 1)
        {
            search = [[NSString alloc] initWithFormat:@"District?$filter=name eq '%@'", querystring];
        }
        if (self.queryOption.selectedSegmentIndex == 2)
        {
            search = [[NSString alloc] initWithFormat:@"District?$filter=cityname eq '%@'", querystring];
        }
        
        QueryOperationResponse *response = [proxy execute:search];
        NSMutableArray *array = [response getResult];
        
        self.resultTextView.text = @"";
        
        for (NorthwindModel_District *obj in array)
        {
            NSMutableString *text = [[NSMutableString alloc] initWithString:self.resultTextView.text];
            NSLog(@"%@", [obj getid]);
            NSString *distrcitId = [[NSString alloc] initWithFormat:@"Distrct Id : %@ \n",[obj getid]];
            NSString *districtName = [[NSString alloc] initWithFormat:@"Distrct Name : %@ \n",[obj getname]];
            NSString *districtCityName = [[NSString alloc] initWithFormat:@"Distrct City Name : %@ \n",[obj getcityName]];
            NSString *districtUnderstand = [[NSString alloc] initWithFormat:@"Distrct Understand : %@ \n",[obj getunderstand]];
            [text appendString:distrcitId];
            [text appendString:districtName];
            [text appendString:districtCityName];
            [text appendString:districtUnderstand];
            self.resultTextView.text = text;
        }

    }
    @catch (NSException *e) {
        NSLog(@"Exception: %@", e);
        self.resultTextView.text = @"Bad Input";
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_queryTextField release];
    [_queryButton release];
    [_resultTextView release];
    [_queryOption release];
    [super dealloc];
}
@end
