//
//  VOYAData.h
//  SampleTest
//
//  Created by Tongzu Ding on 11/17/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VOYAData : NSObject{

    NSString *currentUserName;
}

@property(nonatomic, retain)NSString *currentUserName;
+(VOYAData *)getCurrentUserName;

@end
