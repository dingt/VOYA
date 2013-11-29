//
//  VOYAData.h
//  SampleTest
//
//  Created by Tongzu Ding on 11/17/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VOYAData : NSObject{

    NSString *currentUserName;
    Boolean *isLogin;
}

@property(nonatomic, retain)NSString *currentUserName;
@property Boolean isLogin;
+(VOYAData *)getCurrentUserName;

+(VOYAData *)getisLogin;
@end
