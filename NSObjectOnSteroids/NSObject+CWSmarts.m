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

//Short-hand init
+(instancetype) objectWithDictionary:(NSDictionary *)dictionary
{
    return [[[self class] alloc] initObjectWithDictionary:dictionary];
}

-(instancetype) mapObject:(id)object withValues:(NSDictionary *)dictionary
{
    NSDictionary *modelDefinition = [self modelDefinition];
    
    for (NSString *key in modelDefinition)
    {
        // Validate incoming object. NSNull objects should not be stored.
        id incomingObject = [dictionary valueForKeyPath:modelDefinition[key]];
        if ([CWObjectUtil isValidObject:incomingObject])
            [object setValue:incomingObject forKey:key];
    };
    
    return object;
}

#pragma mark Override SQObjectMethods
-(NSDictionary *) modelDefinition
{
    NSAssert(NO, @"Subclasses need to overwrite model definition in order to make use of CWSmartObject additions");
    return @{};
}

#pragma mark Dictionary output of object
-(NSDictionary *) dictionaryFormat
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    NSDictionary *modelDefinition = [self modelDefinition];

    for (NSString *key in modelDefinition)
    {
        //Not gonna map item if it's null
        if([self valueForKeyPath:key])
            [dictionary setObject:[self valueForKeyPath:key] forKey:modelDefinition[key]];
    }
    
    return dictionary;
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

- (id)initWithCoder:(NSCoder *)coder {
    self = [[[self class] alloc] init];
    if (self != nil)
    {
        NSDictionary *stored = [coder decodeObjectForKey:NSStringFromClass([self class])];
        for (NSString *key in [self modelDefinition]) {
            [self setValue:[stored objectForKey:key] forKey:key];
        }
    }
    return self;
}

#pragma mark SQObject Description method
- (NSString *) description {
    __block NSString *desc = @"";
    for (NSString *key in [self modelDefinition]) {
        desc = [NSString stringWithFormat:@"%@%@: %@\n", desc, key, [self valueForKey:key]];
    }
    return desc;
}

@end
