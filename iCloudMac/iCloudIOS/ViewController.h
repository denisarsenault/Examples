//
//  ViewController.h
//  iCloudIOS
//
//  Created by Denis Arsenault on 10/05/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextView *fileList;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end
