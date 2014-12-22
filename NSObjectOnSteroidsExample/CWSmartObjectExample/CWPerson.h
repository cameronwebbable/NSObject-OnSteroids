//
//  CWPerson.h
//  CWSmartObjectExample
//
//  Created by Cameron Webb on 12/15/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import <NSObject-OnSteroids/NSObject-OnSteroids.h>

@interface CWPerson : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, copy)   NSDictionary *someDictionary;

@end
