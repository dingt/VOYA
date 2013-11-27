//
//  OdataViewController.m
//  VOYA
//
//  Created by Tongzu Ding on 11/25/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "OdataViewController.h"
#import "NorthwindEntities.h"

@interface OdataViewController ()

@end

@implementation OdataViewController

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
    
    //add test for odata query
    NSLog(@"begin");
     NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
     QueryOperationResponse *response = [proxy execute:@"District?$filter=city_id eq ‘1’"];
     NSMutableArray *citiesArray  = [response getResult];
     NorthwindModel_City* city = [citiesArray objectAtIndex:0];
     NSLog(@"City Name = %@", [city getdistricts] );
   // self.distributesLabel.text = [NSString alloc] initwith [city getdistricts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_distributesLabel release];
    [_playLabel release];
    [_seeLabel release];
    [super dealloc];
}
@end
