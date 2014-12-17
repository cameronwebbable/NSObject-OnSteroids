CWSmartObject
=============

Allows you to create objects from dictionaries and just handles a bunch of other annoying tasks. Inspired by code that I wrote while still at Sqwiggle. CWSmartObject is derieved from [SQObject.{h,m} in the Sqwiggle iOS SDK](https://github.com/sqwiggle/sqwiggle-ios-sdk/blob/master/iOSSDK/SQObject.h)

Benefits
--------
- Rapidly map dictionary to object (helpful for dealing with dictionaries from API)
- Export object to dictionary (helpful for when you are needed to post object to API)
- Encoding/Decoding for Coder baked right in.

How to Install
--------------
Add <code>pod 'CWSmartObject'</code> to your podfile, then import <code>\<CWSmartObject/CWSmartObject.h\></code>. Sample code is available under subdirectory "CWSmartObjectExample".

How to Use
-----------
- Create a new class that you'd like to map to from an API. For this example, I'm going to create an object called "Book", and use the following code in .h and .m files, respectively:

``` objc
//Book.h

#import <CWSmartObject/CWSmartObject.h>

@interface Book : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, copy)   NSDictionary *someDictionary;

@end

```

``` objc
//Book.m
#import "Book.h"

@implementation Book

-(NSDictionary *)modelDefinition
{
    return @{@"title" : @"title", @"someDictionary": @"dictKey.importantDictionary"};
}

@end
```

You might be wondering... "WTF IS THAT MODEL DEFINITION CRAP?". It's a method you need to override in this object so it knows which keys map to what property.  The format for modelDefinition is 

``` objc
{"iOS Class Property" : "Dictionary KeyPath"}
```

Also make note of <code>@"dictKey.importantDictionary"</code>. If the concept of KeyValuePath is fuzzy for you, basically adding the "." allows you to traverse a dictionary to get any childern. In this case, <code>@"dictKey.importantDictionary"<\code> implies that the object being passed through here will look like <code>@{@"dictKey": @{@"importantDictionary" : @{@"blah" : @"blah"}}}</code>

- Now that we have the object all handled, let's go ahead and import <code>Book.h</code> elsewhere and initialize a Book object:

``` objc
//SomeOtherClass.m
#import "Book.h"

...

Book *book = [Book objectWithDictionary:@{@"title": @"How Now Brown Cow", @"dictKey" : @{@"importantDictionary" : @{@"blah" : @"hah"}}];
NSLog(@"Book Object: %@ ", book);
NSLog(@"Book Title: %@", book.title);
NSLog(@"Book Dictionary %@", book.someDictionary);

```

As you can now see, the given object has been mapped appropriately to each respective object. SWEET. Obviously my example is very basic, but as we can see this type of thing will be very handy rapidly creating new objects for use in reading in data/dictionaries from APIs. 


ToDo: 
-----
- Tests!
