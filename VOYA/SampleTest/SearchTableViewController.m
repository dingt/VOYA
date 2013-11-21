//
//  SearchTableViewController.m
//  SampleTest
//
//  Created by Eva Lin on 11/21/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()


@end

@implementation SearchTableViewController
@synthesize objects = _objects;
@synthesize result = _result;




- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.objects addObject:@"Boston"];
    [self.objects addObject:@"New York"];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.objects[indexPath.row];
    return cell;
}


@end
