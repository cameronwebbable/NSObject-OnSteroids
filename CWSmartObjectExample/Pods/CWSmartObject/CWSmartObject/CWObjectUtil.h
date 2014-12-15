//
//  CWObjectUtil.h
//  CWSmartObject
//
//  Created by Cameron Webb on 12/14/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWObjectUtil : NSObject

//Checks if given object is a valid object.
+(BOOL) isValidObject:(id)object;

//Checks if given object is a valid dictionary.
+(BOOL) isValidDictionary:(id)dicts;

//Checks if given object is a valid array.
+(BOOL) isValidArray:(id)object;

#pragma mark Date Functions
//NOTE: default format is @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//Also, default timezone is UTC.

//Helper function to create date from string.
+(NSDate *) dateWithString:(NSString *)dateString;

//Helper function to create date from string with given date format.
+(NSDate*) dateWithString:(NSString *)dateString format:(NSString *)format;

//Returns date formatter.
+(NSDateFormatter *) dateFormatter;

//Returns date formatter for given formatter.
+(NSDateFormatter *) dateFormatterFromString:(NSString *)format;

@end
