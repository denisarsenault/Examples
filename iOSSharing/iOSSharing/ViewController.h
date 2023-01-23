//
//  ViewController.h
//  iOSSharing
//
//  Created by Denis Arsenault on 17/09/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *textView;

- (IBAction)shareImage:(id)sender;
- (IBAction)shareText:(id)sender;
@end
