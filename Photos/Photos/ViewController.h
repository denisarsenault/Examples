//
//  ViewController.h
//  Photos
//
//  Created by Denis Arsenault on 17/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)loadFromLibrary:(id)sender;
@end
