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
    NSString *cityName = self.title;
    NSLog(@"cityName = %@", cityName);
    NSString *searchCity = [[NSString alloc] initWithFormat:@"City?$filter=name eq '%@'", cityName];
    NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
    QueryOperationResponse *response = [proxy execute:searchCity];
    NSMutableArray *citiesArray  = [response getResult];
    if (citiesArray == nil)
    {
        self.cityLabel.text = @"Null";
        self.distributesLabel.text = @"Null";
        self.seeLabel.text = @"Null";
        self.playLabel.text = @"Null";
    }
    else {
    NorthwindModel_City *city = [citiesArray objectAtIndex:0];
    
    self.cityLabel.text = [city geturl];

    
    // search the related districts with current city
    NSString *searchDistrict = [[NSString alloc] initWithFormat:@"District?$filter=cityName eq '%@'",cityName];
    QueryOperationResponse *districtResponse = [proxy execute:searchDistrict];
    NSMutableArray *districtArray = [districtResponse getResult];
    
    for (NorthwindModel_District *obj in districtArray)
    {
        NSMutableString *labeltext = [[NSMutableString alloc]initWithString:self.distributesLabel.text];
        NSLog(@"%@", [obj getname]);
        NSString *districtName = [[NSString alloc] initWithFormat:@"District Name : %@ \n", [obj getname]];
        [labeltext appendString:districtName];
        [labeltext appendString:@"District Understanding : \n"];
        NSLog(@"%@", [obj getunderstand]);
        [labeltext appendString:[obj getunderstand]];
        self.distributesLabel.text = labeltext;
    }
    
    // search the related play with current city
    NSString *searchPlay =  [[NSString alloc] initWithFormat:@"Play?$filter=cityName eq '%@'",cityName];
    QueryOperationResponse *playResponse = [proxy execute:searchPlay];
    NSMutableArray *playArray = [playResponse getResult];
    
    for (NorthwindModel_Play *obj in playArray)
    {
        NSMutableString *labelText = [[NSMutableString alloc] initWithString:self.playLabel.text];
        NSLog(@"see type : %@", [obj gettype]);
        NSString *playType = [[NSString alloc] initWithFormat:@"Play Type : %@ \n", [obj gettype]];
        [labelText appendString:playType];
        [labelText appendString:[[NSString alloc] initWithFormat:@"Play Location : %@ \n", [obj getlocation]]];
        NSLog(@"see location : %@", [obj getlocation]);
        [labelText appendString:[obj getexplain]];
        NSLog(@"see explain : %@", [obj getexplain]);
        self.playLabel.text = labelText;
    }
    
    //search the related see with current city
    NSString *searchSee = [[NSString alloc] initWithFormat:@"See?$filter=cityName eq '%@'", cityName];
    QueryOperationResponse *seeResponse = [proxy execute:searchSee];
    NSMutableArray *seeArray = [seeResponse getResult];
    
    for (NorthwindModel_See *obj in seeArray)
    {
        NSMutableString *labeltext = [[NSMutableString alloc] initWithString:self.seeLabel.text];
        NSLog(@"place name : %@", [obj getplaceName]);
        NSLog(@"intro : %@", [obj getintro]);
        NSString *place = [[NSString alloc] initWithFormat:@"Place Name : %@ \n Introduction : %@ \n", [obj getplaceName], [obj getintro]];
        [labeltext appendString:place];
        self.seeLabel.text = labeltext;
    }
    
    // search understand of the city
    NSString *searchUnderstand = [[NSString alloc] initWithFormat:@"Understand?$filter=cityName eq '%@'", cityName];
    QueryOperationResponse *understandResponse = [proxy execute:searchUnderstand];
    NSMutableArray *understandArray = [understandResponse getResult];
    
    NorthwindModel_Understand *understand = [understandArray objectAtIndex:0];
    NSString *under = [[NSString alloc] initWithFormat:@"History : %@ \n Today : %@ \n\n Visit Time : %@ ", [understand gethistory]
                       , [understand gettoday], [understand getvisitTime]];
    self.cityLabel.text = under;
    }
    

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
    [_cityLabel release];
    [super dealloc];
}
@end
