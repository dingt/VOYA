//
//  ViewController.h
//  SampleTest
//
//  Created by CHIRU on 13-11-14.
//  Copyright (c) 2013年 CHIRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController
<UISearchBarDelegate>
@property(nonatomic, retain)NSMutableArray *cities;
@property(nonatomic, retain)NSMutableArray *allFilteredFile;  //the filter cities

@property(nonatomic,retain)IBOutlet UISearchBar *SearchBar;
 @property(nonatomic,retain)IBOutlet UIButton * LoginButton;



//@property (retain, nonatomic) IBOutlet UITableView *cityTableView;


@end
