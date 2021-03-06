//
//  OdataViewController.m
//  VOYA
//
//  Created by Tongzu Ding on 11/25/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
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
    @try {
        //add test for odata query
        NSLog(@"odataviewbegin");
        NSString *cityName = self.title;
        NSLog(@"cityName = %@", cityName);
        NSString *searchCity = [[NSString alloc] initWithFormat:@"City?$filter=name eq '%@'", cityName];
        NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
        QueryOperationResponse *response = [proxy execute:searchCity];
        NSMutableArray *citiesArray  = [response getResult];
        if (citiesArray == nil)
        {
            self.cityTextView.text = @"Null";
            self.districtTextView.text = @"Null";
            self.seeTextView.text = @"Null";
            self.playTextView.text = @"Null";
        }
        else {
            NorthwindModel_City *city = [citiesArray objectAtIndex:0];
            
            self.cityTextView.text = [city geturl];
            
            
            // search the related districts with current city
            NSString *searchDistrict = [[NSString alloc] initWithFormat:@"District?$filter=cityName eq '%@'",cityName];
            QueryOperationResponse *districtResponse = [proxy execute:searchDistrict];
            NSMutableArray *districtArray = [districtResponse getResult];
            
            for (NorthwindModel_District *obj in districtArray)
            {
                NSMutableString *labeltext = [[NSMutableString alloc]initWithString:self.districtTextView.text];
                NSLog(@"%@", [obj getname]);
                NSString *districtName = [[NSString alloc] initWithFormat:@"District Name : %@ \n", [obj getname]];
                [labeltext appendString:districtName];
                [labeltext appendString:@"District Understanding : \n"];
                NSLog(@"%@", [obj getunderstand]);
                [labeltext appendString:[obj getunderstand]];
                self.districtTextView.text = labeltext;
            }
            
            // search the related play with current city
            NSString *searchPlay =  [[NSString alloc] initWithFormat:@"Play?$filter=cityName eq '%@'",cityName];
            QueryOperationResponse *playResponse = [proxy execute:searchPlay];
            NSMutableArray *playArray = [playResponse getResult];
            
            for (NorthwindModel_Play *obj in playArray)
            {
                NSMutableString *labelText = [[NSMutableString alloc] initWithString:self.playTextView.text];
                NSLog(@"see type : %@", [obj gettype]);
                NSString *playType = [[NSString alloc] initWithFormat:@"Play Type : %@ \n", [obj gettype]];
                [labelText appendString:playType];
                [labelText appendString:[[NSString alloc] initWithFormat:@"Play Location : %@ \n", [obj getlocation]]];
                NSLog(@"see location : %@", [obj getlocation]);
                [labelText appendString:[obj getexplain]];
                NSLog(@"see explain : %@", [obj getexplain]);
                self.playTextView.text = labelText;
            }
            
            //search the related see with current city
            NSString *searchSee = [[NSString alloc] initWithFormat:@"See?$filter=cityName eq '%@'", cityName];
            QueryOperationResponse *seeResponse = [proxy execute:searchSee];
            NSMutableArray *seeArray = [seeResponse getResult];
            
            for (NorthwindModel_See *obj in seeArray)
            {
                NSMutableString *labeltext = [[NSMutableString alloc] initWithString:self.seeTextView.text];
                NSLog(@"place name : %@", [obj getplaceName]);
                NSLog(@"intro : %@", [obj getintro]);
                NSString *place = [[NSString alloc] initWithFormat:@"Place Name : %@ \n Introduction : %@ \n", [obj getplaceName], [obj getintro]];
                [labeltext appendString:place];
                self.seeTextView.text = labeltext;
            }
            
            // search understand of the city
            NSString *searchUnderstand = [[NSString alloc] initWithFormat:@"Understand?$filter=cityName eq '%@'", cityName];
            QueryOperationResponse *understandResponse = [proxy execute:searchUnderstand];
            NSMutableArray *understandArray = [understandResponse getResult];
            
            NorthwindModel_Understand *understand = [understandArray objectAtIndex:0];
            NSString *under = [[NSString alloc] initWithFormat:@"History : %@ \n Today : %@ \n\n Visit Time : %@ ", [understand gethistory]
                               , [understand gettoday], [understand getvisitTime]];
            self.cityTextView.text = under;
        }

    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", exception);
        self.cityTextView.text = @"Null";
        self.districtTextView.text = @"Null";
        self.seeTextView.text = @"Null";
        self.playTextView.text = @"Null";
    }
 

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DistrictDetail"]){
        [[segue destinationViewController] setTitle: self.title];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_cityTextView release];
    [_districtTextView release];
    [_playTextView release];
    [_seeTextView release];
    [_districtDetailButton release];
    [_playDetailButton release];
    [_seeDetailButton release];
    [super dealloc];
}
@end
