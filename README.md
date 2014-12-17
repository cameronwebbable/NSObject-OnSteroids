CWSmartObject
=============

Allows you to create objects from dictionaries and just handles a bunch of other annoying tasks. Inspired by code that I wrote while still at Sqwiggle. CWSmartObject is derieved from [SQObject.{h,m} in the Sqwiggle iOS SDK](https://github.com/sqwiggle/sqwiggle-ios-sdk/blob/master/iOSSDK/SQObject.h)

Benefits
--------
- Rapidly map dictionary to object (helpful for dealing with dictionaries from REST APIs)
- Export object to dictionary (helpful for when you are needed to post object to Rest APIs)
- Encoding/Decoding for Coder baked right in.

How to Install
--------------
Add <code class="language-objc">pod 'CWSmartObject'</code> to your podfile, then import <code class="language-objc">\<CWSmartObject/CWSmartObject.h\></code>. Sample code is available under subdirectory "CWSmartObjectExample".

How to Use
-----------
Create a new class that you'd like to map to. For this example, I'm going to create an object called "Book", and use the following code in .h and .m files, respectively:

** Objective-C ** 
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

** Swift (note: objects have to inheret NSObject. Sorry :-/. I'll update this later) **
``` obj-c
//Objective-C Bridging Header
...
#import <CWSmartObject/CWSmartObject.h>
```

``` swift
//Book.swift
class Book : NSObject {
    ... 
    override func modelDefinition() -> [NSObject : AnyObject]! {
        return ["title" : "title", "someDictionary" : "dictKey.importDictionary"]
    }
}
```

You might be wondering... "WTF IS THAT MODEL DEFINITION CRAP?". It's a method you need to override in this object so it knows which keys map to what property.  The format for modelDefinition is 

``` objc
{"iOS Class Property" : "Dictionary KeyPath"}
```

Also make note of <code class="language-objc">@"dictKey.importantDictionary"</code>. If the concept of KeyValuePath is fuzzy for you, basically adding the "." allows you to traverse a dictionary to get any childern. In this case, <code>@"dictKey.importantDictionary"</code> implies that the object being passed through here will look like <code class="language-objc">{dictKey": {"importantDictionary" : {"blah" : "blah"}}}</code>

Now that we have the object all handled, let's go ahead and import <code>Book.h</code> elsewhere and initialize a Book object:

** Objective-C **
``` objc
//SomeOtherClass.m
#import "Book.h"

...

Book *book = [Book objectWithDictionary:@{@"title": @"How Now Brown Cow", @"dictKey" : @{@"importantDictionary" : @{@"blah" : @"hah"}}];
NSLog(@"Book Object: %@ ", book);
NSLog(@"Book Title: %@", book.title);
NSLog(@"Book Dictionary %@", book.someDictionary);

```

** Swift ** 
``` swift
//SomeOtherClass.swift
import Book

...

var Book : Book = Book(dictionary: ["title": "How Now Brown Cow", "dictKey" : ["importantDictionary" : ["blah" : "blah"]]])

println("Book Object: \(book)")
println("Book Title: \(book.title)")
println("Book Dictionary: \(book.someDictionary)")

```

As you can now see, the given object has been mapped appropriately to each respective object. SWEET. 

Let's say I want to be able to get a dictionary format of the object I've just created. Simply do:

** Objective-C ** 
``` objc
[book dictionaryFormat];

```

** Swift **
``` swift
book.dictionaryFormat()

```

And you will be returned a dictionary of all properties and their respective values:

``` objc
{
    dictKey = {"importantDictionary" : {"blah" : "hah"}};
    title = "How Now Brown Cow";
}
```

Sweet Jesus! Effectively removes the need for you to write any code to create a nicely formatted dictionary for posting, because it already knows what fields your API is using! 

Feedback?
--------------
Open a GH Issue. Happy to discuss questions. This is still quite early and there's a number of other ways I could go. 

ToDo: 
-----
- Tests!
