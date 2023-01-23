//
//  AppDelegate.h
//  iCloudMac
//
//  Created by Denis Arsenault on 9/05/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSString* cloudString;

@property (strong) NSArray* filesInCloudStorage;

- (IBAction)addFile:(id)sender;
@end
