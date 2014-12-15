//
//  CWPerson.m
//  CWSmartObjectExample
//
//  Created by Cameron Webb on 12/15/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import "CWPerson.h"

@implementation CWPerson

-(NSDictionary *)modelDefinition
{
    return @{@"title" : @"title", @"someDictionary": @"dictionary_from_dictionary"};
}

@end
