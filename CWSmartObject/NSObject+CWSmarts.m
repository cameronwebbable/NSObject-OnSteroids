//
//  NSObject+CWSmarts.m
//  CWSmartObject
//
//  Created by Cameron Webb on 12/12/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import "NSObject+CWSmarts.h"

@interface NSObject (CWSmartsInternal)
-(instancetype) mapObject:(id)object withValues:(NSDictionary *)dictionary;
@end

@implementation NSObject (CWSmarts)

-(instancetype) initObjectWithDictionary:(NSDictionary *)dictionary
{
    if (!self)
        self = [self init];
    
    if (self != nil)
    {
        [self mapObject:self withValues:dictionary];
    }
    return self;
}

#pragma mark Override SQObjectMethods
-(NSDictionary *) modelDefinition
{
    NSAssert(NO, @"Subclasses need to overwrite model definition in order to make use of CWSmartObject additions");
    return @{};
}

#pragma mark NSObject methods for storage/etc
- (void)encodeWithCoder:(NSCoder *)coder {
    NSMutableDictionary *encodeDictionary = [NSMutableDictionary new];
    
    for (NSString *key in [self modelDefinition]) {
        if ([self valueForKey:key] != nil)
            [encodeDictionary setObject:[self valueForKey:key] forKey:key];

    }
    [coder encodeObject:encodeDictionary forKey:NSStringFromClass([self class])];
}
    

@end
