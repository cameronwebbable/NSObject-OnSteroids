//
//  ViewController.m
//  CWSmartObjectExample
//
//  Created by Cameron Webb on 12/15/14.
//  Copyright (c) 2014 Cameron Webb. All rights reserved.
//

#import "ViewController.h"
#import "CWPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CWPerson *person = [CWPerson objectWithDictionary:@{@"title": @"Le Ron James", @"dictionary_from_dictionary": @{@"how": @"now", @"brown": @"cow"}}];
    
    NSLog(@"we have a person with title %@ and dictionary %@", person.title, person.someDictionary);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
