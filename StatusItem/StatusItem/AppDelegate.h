//
//  AppDelegate.h
//  StatusItem
//
//  Created by Denis Arsenault on 4/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSMenu *menu;
- (IBAction)quit:(id)sender;
@end
