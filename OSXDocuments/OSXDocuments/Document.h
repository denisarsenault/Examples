//
//  Document.h
//  OSXDocuments
//
//  Created by Denis Arsenault on 26/02/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
@property (strong) NSString* text;
@property (assign) BOOL checked;
@property (strong) IBOutlet NSButton *checkbox;
@property (strong) IBOutlet NSTextField *textField;

@end
