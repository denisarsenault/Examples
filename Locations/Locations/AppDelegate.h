//
//  AppDelegate.h
//  Locations
//
//  Created by Denis Arsenault on 29/03/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, CLLocationManagerDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *latitudeLabel;
@property (weak) IBOutlet NSTextField *longitudeLabel;
@property (weak) IBOutlet NSTextField *accuracyLabel;
@property (weak) IBOutlet NSTextField *addressLabel;

@property (weak) IBOutlet NSProgressIndicator *spinner;

@end
