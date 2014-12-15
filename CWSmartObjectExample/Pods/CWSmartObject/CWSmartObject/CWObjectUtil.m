//
//  CWObjectUtil.m
//  CWSmartObject
//
//  Created by Cameron Webb on 12/14/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import "CWObjectUtil.h"

@implementation CWObjectUtil

+ (BOOL)isValidObject:(id)object
{
    if (!object || [object isKindOfClass:[NSNull class]])
        return NO;
    
    return YES;
}

+ (BOOL)isValidDictionary:(id)object
{
    if (object && [object isKindOfClass:[NSDictionary class]] && ([[object allKeys] count] > 0))
        return YES;
    
    return NO;
}

+ (BOOL)isValidArray:(id)object
{
    if (object && [object isKindOfClass:[NSArray class]] && ([object count] > 0))
        return YES;
    
    return NO;
}

+(NSDate *) dateWithString:(NSString *)dateString
{
    return [[self dateFormatter] dateFromString:dateString];
}

+ (NSDate*)dateWithString:(NSString*)dateString format:(NSString *)format
{
    NSDate *date = [[self dateFormatterFromString:format] dateFromString:dateString];
    return date;
}

+ (NSDateFormatter *)dateFormatter
{
    return [self dateFormatterFromString:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
}

+ (NSDateFormatter *)dateFormatterFromString:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    //TODO: eventually surface a way to set timezone. For now, just assume UTC by default.
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return formatter;
}
@end
