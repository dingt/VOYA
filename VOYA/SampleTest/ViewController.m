//
//  ViewController.m
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "VOYAData.h"
#import "PageViewController.h"
@interface ViewController ()
{
    NSMutableArray *cities;
}

@end

@implementation ViewController
@synthesize LoginButton,SearchBar;
@synthesize cityTableView=_cityTableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cities = [NSMutableArray arrayWithObjects:@"Dollar", @"Euro", @"Pound", nil];
    [cities addObject:@"Boston"];
    
    VOYAData *user = [VOYAData getisLogin];
    
    if([user isLogin] == YES)
    {
        [self.LoginButton setHidden:YES];
    }
    
    SearchBar.delegate = self;
    SearchBar.showsCancelButton=YES;
    
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]<7.0){
         SearchBar.backgroundColor = [UIColor clearColor];
         SearchBar.multipleTouchEnabled = YES;
        [ SearchBar setAutocorrectionType:UITextAutocorrectionTypeNo];
        [[ SearchBar.subviews objectAtIndex:0]removeFromSuperview];
    }
    else{
         SearchBar.backgroundColor = [UIColor clearColor];
         SearchBar.translucent=YES;
         SearchBar.barTintColor=[UIColor clearColor];
    }
    
    for (UIView *subview in  SearchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
            [subview removeFromSuperview];
            break;
        }
    }
    
    
    
}
-(void)Login{
    LoginViewController *view=[[LoginViewController alloc] init];
    [self.navigationController pushViewController:view animated:NO];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UISearchBarDelegate Methods

//- (void)filterContentForSearchText:(NSString*)searchText
//{
//  
//}
//
//- (void)searchBar:(UISearchBar *)searchBar
//    textDidChange:(NSString *)searchText {
//  
//}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {

    [self searchBar:searchBar activate:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
  
    [self searchBar:searchBar activate:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text=@"";
  //  isSearching = NO;
    [self searchBar:searchBar activate:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self searchBar:searchBar activate:NO];
    
}

- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active{
  
    if (!active) {
        [searchBar resignFirstResponder];
        [searchBar setShowsCancelButton:active animated:NO];
        
    } else {
        [searchBar setShowsCancelButton:active animated:YES];
    }
}  

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    cell.textLabel.text = cities[indexPath.row];

    //cell.textLabel.text = self.cities[indexPath.row];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showPageView"])
    {
       
        NSIndexPath *indexpath =nil;
        indexpath = [self.cityTableView indexPathForSelectedRow];
        NSString *city = [cities objectAtIndex:indexpath.row];
        NSLog(@"bb");
        
        [[segue destinationViewController] setCityLabel:city];
    }
}

- (void)dealloc {
    [_cityTableView release];
    [super dealloc];
}
@end
