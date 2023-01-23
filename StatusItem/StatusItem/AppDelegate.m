//
//  AppDelegate.m
//  StatusItem
//
//  Created by Denis Arsenault on 4/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    NSStatusItem* statusItem;
}

@end 

@implementation AppDelegate

@synthesize window = _window;
@synthesize menu = _menu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    statusItem.title = @"Test";
    statusItem.menu = self.menu;
    statusItem.highlightMode = YES;
}

- (IBAction)quit:(id)sender {
    [[NSApplication sharedApplication] terminate:nil];
}
@end
