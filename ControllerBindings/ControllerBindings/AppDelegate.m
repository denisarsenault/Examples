//
//  AppDelegate.m
//  ControllerBindings
//
//  Created by Denis Arsenault on 28/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize notes = _notes;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.notes = [NSMutableArray array];
    // Insert code here to initialize your application
}

@end
