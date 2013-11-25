//
//  xmlElement.m
//  VOYA
//
//  Created by Eva Lin on 11/24/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import "xmlElement.h"

@implementation xmlElement

- (NSMutableArray *) subElement{
    if (_subElement == nil)
    {
        _subElement = [[NSMutableArray alloc] init];
    }
    return _subElement;
}

@end
