//
//  ViewController.h
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController
<UISearchBarDelegate>
@property(nonatomic,retain)IBOutlet UISearchBar *SearchBar;
 @property(nonatomic,retain)IBOutlet UIButton * LoginButton;

@property(nonatomic, strong)NSMutableArray *cities;

@property (retain, nonatomic) IBOutlet UITableView *cityTableView;

@property(nonatomic, strong)NSMutableArray *results;
@end
