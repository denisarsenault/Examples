//
//  ViewController.h
//  PrintingiOS
//
//  Created by Denis Arsenault on 1/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)print:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@end
