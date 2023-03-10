//
//  Note.h
//  ControllerBindings
//
//  Created by Denis Arsenault on 28/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSAttributedString* text;
@property (strong) NSDate* created;
@property (strong) NSDate* edited;


@end
