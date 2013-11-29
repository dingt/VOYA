//
//  VOYAData.m
//  SampleTest
//
//  Created by Tongzu Ding on 11/17/13.
//  Copyright (c) 2013 CHIRU. All rights reserved.
//

#import "VOYAData.h"

@implementation VOYAData
@synthesize currentUserName;
static VOYAData *userName=nil;


+(VOYAData *)getCurrentUserName
{
    @synchronized(self)
    {
        if(userName==nil)
        {
            userName = [VOYAData new];
        }
    }
    return userName;
}

+(VOYAData *)getisLogin
{
    @synchronized(self)
    {
        if(userName==nil)
        {
            userName = [VOYAData new];
        }
    }
    return userName;
}
@end
