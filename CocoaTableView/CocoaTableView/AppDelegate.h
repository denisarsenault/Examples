//
//  AppDelegate.h
//  CocoaTableView
//
//  Created by Denis Arsenault on 01/7/23.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>


@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

@property (weak) IBOutlet NSArrayController *pathsController;
@property (weak) IBOutlet NSButton *requiredText;

- (IBAction)enable:(id)sender;
- (IBAction)required:(id)sender;

- (IBAction)enableAll;
- (IBAction)cancel;


@end
