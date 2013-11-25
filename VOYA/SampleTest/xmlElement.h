//
//  xmlElement.h
//  VOYA
//
//  Created by Eva Lin on 11/24/13.
//  Copyright (c) 2013 yangxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xmlElement : NSObject
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSDictionary *attributes;

@property (nonatomic, strong) NSMutableArray *subElement;

@property (nonatomic, strong) xmlElement *parent;

@end
