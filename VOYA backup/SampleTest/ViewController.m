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


@end

@implementation ViewController
@synthesize LoginButton,SearchBar;
//@synthesize cityTableView=_cityTableView;
@synthesize cities,allFilteredFile;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    cities = [NSMutableArray arrayWithObjects:@"Dollar", @"Euro", @"Pound", nil];
//    [cities addObject:@"Boston"];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"CityList" ofType:@"plist"];
	NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:path];
	self.cities=[[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    allFilteredFile = [[NSMutableArray alloc]init];
	[dict release];

    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
   
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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];

    
    
}
-(void)viewTapped:(UITapGestureRecognizer*)tap{
    [self.SearchBar resignFirstResponder];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[defaults objectForKey:@"isLogin"]);
    if ([[defaults objectForKey:@"isLogin"] isEqualToString:@"YES"]){
        if(![[defaults objectForKey:@"UserName"] isEqualToString:@"root"]){
        [self.LoginButton setHidden:YES];
          
        }
    }else{
        [self.LoginButton setHidden:NO];
        [self.LoginButton setTitle:@"Login" forState:UIControlStateNormal];
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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [self.cities objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark UISearchBarDelegate Methods

- (void)filterContentForSearchText:(NSString*)searchText
{
    if([self.allFilteredFile count]>0) {
        [self.allFilteredFile removeAllObjects]; // First clear the filtered array.
	}

    NSString *path=[[NSBundle mainBundle]pathForResource:@"CityList" ofType:@"plist"];
	NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:path];
    if([searchText length]==0){
        [self.allFilteredFile addObjectsFromArray:[[dict allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    }else{
    if([[dict allKeys] count]>0){
        for (NSString *city in [dict allKeys] ) {
         //   NSLog(@"%@",searchText);
            if ([city rangeOfString:searchText options:NSCaseInsensitiveSearch].length != 0)
                [self.allFilteredFile addObject:city];
        }//end for
    }//end if
    }//end else
  
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText {
  
    [self filterContentForSearchText:searchText];
  //  [self.cities removeAllObjects];
    self.cities=self.allFilteredFile;
    [self.tableView reloadData];
    self.SearchBar.text=searchText;
}

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
  
 //   [searchBar setShowsCancelButton:YES];
    if (!active) {
        [searchBar resignFirstResponder];
         [searchBar setShowsCancelButton:active animated:NO];
        
    } else {
        [searchBar setShowsCancelButton:active animated:YES];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showPageView"])
    {
        NSIndexPath *indexpath =nil;
        indexpath = [self.tableView indexPathForSelectedRow];
        NSString *city = [cities objectAtIndex:indexpath.row];
        NSLog(@"%@",city);
        [[segue destinationViewController] setTitle:city];
    }
}

- (void)dealloc {
  //  [_cityTableView release];
    [self.cities release];
    [self.allFilteredFile release];
    [super dealloc];
}
@end
