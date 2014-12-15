//
//  NSObject+CWSmarts.h
//  CWSmartObject
//
//  Created by Cameron Webb on 12/12/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWObjectUtil.h"

@interface NSObject (CWSmarts)
//Takes given dictionary and returns a new object with mapped properties
-(instancetype) initObjectWithDictionary:(NSDictionary *) dictionary;

//Takes given dictionary and returns a new object with mapped properties
+(instancetype) objectWithDictionary:(NSDictionary *) dictionary;

//Returns current object in dictonary format, based on defined model definition. As neat as it sounds!
-(NSDictionary *) dictionaryFormat;

//Returns current key/value maping for given object. Must be overridden in subclass, or these tools are worthless.
-(NSDictionary *) modelDefinition;
@end
