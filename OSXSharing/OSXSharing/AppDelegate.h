//
//  AppDelegate.h
//  OSXSharing
//
//  Created by Denis Arsenault on 17/09/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextField *textField;

@property (assign) IBOutlet NSWindow *window;

- (IBAction)shareImage:(id)sender;
- (IBAction)shareText:(id)sender;
@end
