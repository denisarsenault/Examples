//
//  Note.m
//  ControllerBindings
//
//  Created by Denis Arsenault on 28/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize text = _text;
@synthesize created = _created;
@synthesize edited = _edited;
@synthesize title = _title;

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"New note";
        self.created = [NSDate date];
    }
    return self;
}

// If the title or text are modified, set the edited date to now
- (void)setTitle:(NSString *)title {
    _title = title;
    self.edited = [NSDate date];
}

- (void)setText:(NSAttributedString *)text {
    _text = text;
    self.edited = [NSDate date];
}

@end
