//
//  PlayDetailViewController.m
//  VOYA
//
//  Created by Eva Lin on 11/28/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "PlayDetailViewController.h"
#import "NorthwindEntities.h"

@interface PlayDetailViewController ()

@end

@implementation PlayDetailViewController

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
- (IBAction)queryButtonClick:(id)sender {
    @try {
        NSString *querystring = self.textField.text;
        NorthwindEntities *proxy = [[NorthwindEntities alloc] initWithUri:@"http://localhost:8886/test2.svc/" credential:nil];
        NSString *search;
        if (self.optionSegment.selectedSegmentIndex == 0)
        {
            search = [[NSString alloc] initWithFormat:@"Play(%@)", querystring];
        }
        if (self.optionSegment.selectedSegmentIndex == 1)
        {
            search = [[NSString alloc] initWithFormat:@"Play?$filter=playTpy eq '%@'", querystring];
        }
        if (self.optionSegment.selectedSegmentIndex == 2)
        {
            search = [[NSString alloc] initWithFormat:@"Play?$filter=cityName eq '%@'", querystring];
        }
        
        QueryOperationResponse *response = [proxy execute:search];
        NSMutableArray *array = [response getResult];
        
        self.textView.text = @"";
        
        for (NorthwindModel_Play *obj in array)
        {
            NSMutableString *text = [[NSMutableString alloc] initWithString:self.textView.text];
            NSLog(@"%@", [obj getid]);
            NSString *playId = [[NSString alloc] initWithFormat:@"Play Id : %@ \n",[obj getid]];
            NSString *playType = [[NSString alloc] initWithFormat:@"Play Type : %@ \n",[obj gettype]];
            NSString *playLocation = [[NSString alloc] initWithFormat:@"Location : %@ \n",[obj getlocation]];
            NSString *playExplain = [[NSString alloc] initWithFormat:@"Explain : %@ \n",[obj getexplain]];
            NSString *playCityName = [[NSString alloc] initWithFormat:@"City Name : %@ \n",[obj getcityName]];
            [text appendString:playId];
            [text appendString:playCityName];
            [text appendString:playType];
            [text appendString:playLocation];
            [text appendString:playExplain];
            self.textView.text = text;
        }
        
    }
    @catch (NSException *e) {
        NSLog(@"Exception: %@", e);
        self.textView.text = @"Bad Input";
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
