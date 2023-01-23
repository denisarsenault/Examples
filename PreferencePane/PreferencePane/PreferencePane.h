//
//  PreferencePane.h
//  PreferencePane
//
//  Created by Denis Arsenault on 4/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>

@interface PreferencePane : NSPreferencePane

- (void)mainViewDidLoad;

@property (assign) IBOutlet NSButton *checkbox;

@end
