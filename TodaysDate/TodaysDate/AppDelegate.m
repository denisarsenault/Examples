//
//  AppDelegate.m
//  TodaysDate
//
//  Created by Denis Arsenault on 7/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize dateLabel = _dateLabel;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    /*
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];*/
    
    [dateFormatter setDateFormat:@"HH:mm, MMMM d"];
    
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    
    
    self.dateLabel.stringValue = [NSString stringWithFormat:@"The current date is %@", dateString];
    
}

@end
