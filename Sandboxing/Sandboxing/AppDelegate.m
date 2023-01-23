//
//  AppDelegate.m
//  Sandboxing
//
//  Created by  on 18/07/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    
}

@property (readonly) NSArray* files;

@end

@implementation AppDelegate

@dynamic files;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSURL*) fileURL {
    
    /// Get the count For the Application Resource directory
    ///NSUInteger count = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] count];
    NSURL* bookmarkStorageURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    bookmarkStorageURL = [bookmarkStorageURL URLByAppendingPathComponent:@"saved_defaultbookmarks.bookmark"];
    
    NSData* bookmarkData = [NSData dataWithContentsOfURL:bookmarkStorageURL];
    
    NSURL* bookmark = nil;
    
    NSLog(@" bookmarkData:: %@", bookmarkData);
    
    if (bookmarkData) {
        
        BOOL isStale = NO;
        NSError* error = nil;
        bookmark = [NSURL URLByResolvingBookmarkData:bookmarkData options:NSURLBookmarkResolutionWithSecurityScope relativeToURL:nil bookmarkDataIsStale:&isStale error:&error];
        
        [[NSUserDefaults standardUserDefaults] setURL:bookmark forKey:@"path"];
    }
    

    return bookmark;
}

/// Retrieves files from Bookmark data

- (NSArray *)files {
    NSURL* url = [self fileURL];
     
    if (url == nil) {
        return nil;
    }
    
    [url startAccessingSecurityScopedResource];
    
    NSError* error = nil;
    NSLog(@"Security Scoped Bookmarks are Directory: %@", url);
    
    NSArray* files = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:url includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    
    NSLog(@"Security Scoped Bookmarks are files/:: %@", files);
    
    [url stopAccessingSecurityScopedResource];
    
    return files;
}

/// ChooseFolder adapted to
///
/// NSOpenPanel* openDlg = [NSOpenPanel openPanel];
//NSButton *button = [[NSButton alloc] init];
//[button setButtonType:NSSwitchButton];
//button.title = NSLocalizedString(@"I am a checkbox", @"");
//[button sizeToFit];
//[openDlg setAccessoryView:button];
//openDlg.delegate = self;
//[openDlg beginSheetModalForWindow:self.window completionHandler:^(NSInteger result)
//{
//    openDlg.delegate = nil; // TODO: Check if this is necessary
//    if (result != NSFileHandlingPanelOKButton) return;
//    BOOL checkboxOn = (((NSButton*)openDlg.accessoryView).state == NSOnState);
//    // Do something
//}];

- (IBAction)chooseFolder:(id)sender {
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    NSURL *myURL = [NSURL URLWithString:@"file:///Library"];
    NSMutableArray *urlArr = [[NSMutableArray alloc] initWithCapacity:0];
    for(int i=0;i<5;i++) {
        [urlArr addObject:myURL];
        }
    
    NSButton *button = [[NSButton alloc] init];
    [button setButtonType:NSSwitchButton];
    button.title = NSLocalizedString(@"I am a checkbox", @"");
    [button sizeToFit];


    panel.canChooseFiles = NO;
    panel.canChooseDirectories = YES;
    panel.allowsMultipleSelection = YES;
    panel.resolvesAliases = YES;
    panel.canCreateDirectories = NO;

    [panel setAccessoryView:button];
//    panel.delegate = self;
    [panel beginWithCompletionHandler:^(NSInteger result) {
        
        if (result != NSFileHandlingPanelOKButton) return;
            BOOL checkboxOn = (((NSButton*)panel.accessoryView).state == NSOnState);
        
        if (result == NSOKButton) {
        
            //// This will display existibng files
            
            [self willChangeValueForKey:@"files"];
            [self willChangeValueForKey:@"folders"];
            
            /// Get User default for panel.URL
            
            [[NSUserDefaults standardUserDefaults] setURL:panel.URL forKey:@"path"];
            
            /// Create the bookmark file for storing bookmark
            
            NSURL* bookmarkStorageURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
            bookmarkStorageURL = [bookmarkStorageURL URLByAppendingPathComponent:@"saved_defaultbookmarks.bookmark"];
            
            //[panel ];
            NSArray *bookmarkURLs = [panel URLs];
            
            NSLog(@"URLByAppendingPathComponent bookmarkURLs:: %@!", bookmarkURLs);

            //NSMutableData *data;
            NSMutableData *bookMasterData = [[NSMutableData alloc] init];
            int i = 0;
            if( bookmarkURLs != nil && [bookmarkURLs count] >= 1 ) {
                for (i = 0; i < [bookmarkURLs count]; i = i + 1 ){
                    NSURL *bookmarkURL = [bookmarkURLs objectAtIndex:i];
                    
                    //NSURL* bookmarkStorageURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
                    //bookmarkURLs = [bookmarkURLs URLByAppendingPathComponent:@"saved_bookmark.bookmark"];
                    
                    NSError *error = nil;
                    NSData *bookmarkData = [bookmarkURL bookmarkDataWithOptions:NSURLBookmarkCreationWithSecurityScope
                                                 includingResourceValuesForKeys:nil
                                                                  relativeToURL:nil // Make it app-scoped
                                                                          error:&error];
                    if (error) {
                        NSLog(@"Error creating bookmark for bookmarkURL (%@): %@", bookmarkURL, error);
                        [NSApp presentError:error];
                    }
                    
                    NSLog(@"bookmarkData: %@", bookMasterData);
                    
//                    On a somewhat related note, here's how you would convert the NSData back to an NSArray:
//                    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data]
//
//                    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
//                    Note that all the objects in array must conform to the NSCoding protocol. If these are custom objects, then that means you need to read up on Encoding and Decoding Objects.
                    
                    //[bookmarkData writeToURL:bookmarkStorageURL atomically:YES];
                    //data = [NSMutableData dataWithData:bookmarkData];
                    
                    NSMutableData* data = [bookmarkData mutableCopy];
                    [bookMasterData appendData:data]; /// Add existing data
                    ///
                    NSLog(@"Write bookmarkURLs:====>: %@", bookmarkURLs);
                    NSLog(@"Write bookmarkURLs objectAtIndex:i:====>: %@", [bookmarkURLs objectAtIndex:i]);
                    NSLog(@"Write bookmarkStorageURL:====>: %@", bookmarkStorageURL);
                    NSLog(@"Write data:====>: %@", data);
                    NSLog(@"Write bookMasterData:====>: %@", bookMasterData);
                }
            }
            
            /// Write the data ot the bookmark file
            NSString *bookMark = [[NSString alloc] initWithData:bookMasterData encoding:NSUTF8StringEncoding];
            NSLog(@"Write bookMark:====>: %@", bookMark);
            
            [bookMasterData writeToURL:bookmarkStorageURL atomically:YES];
            NSLog(@"Write bookmarkStorageURL:====>: %@", bookmarkStorageURL);
            NSLog(@"Write bookMasterData:====>: %@", bookMasterData);
            
            [self didChangeValueForKey:@"files"];
            [self didChangeValueForKey:@"folders"];

        }
    }];
}

- (void)panelSelectionDidChange:(id)sender {
    NSOpenPanel *panel = sender;
    NSButton *button = (NSButton*)panel.accessoryView;
    // Update button based on panel selection
}

@end
