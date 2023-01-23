//
//  AppDelegate.h
//  DataDetectors
//
//  Created by Denis Arsenault on 10/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSTextField *outputTextField;

- (IBAction)check:(id)sender;
@end
