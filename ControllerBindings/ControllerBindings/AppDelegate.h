//
//  AppDelegate.h
//  ControllerBindings
//
//  Created by Denis Arsenault on 28/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSMutableArray* notes;

@end
