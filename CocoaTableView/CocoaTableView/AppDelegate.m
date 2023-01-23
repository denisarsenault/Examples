//
//  AppDelegate.m
//  CocoaTableView
//
//  Created by Denis Arsenault on 01/7/23.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"
#import "Path.h"

@interface AppDelegate ()

@property NSMutableArray *pathsArray;;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    
    _pathsArray = [NSMutableArray array];
    
    Path* aPath;
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/Cookies/";
    aPath.purpose = @"Remediation of Application Cookies";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/Application Support/";
    aPath.purpose = @"Remediation of Application Libraries";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/Preferences/Macromedia/Flash Player/";
    aPath.purpose = @"Remediation of Flash Player";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/Application Support/Google/Chrome/Default/Pepper Data/Shockwave Flash/WritableRoot/";
    aPath.purpose = @"Remediation of Google Chrome ";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~//Library/Application Support/Chromium/Default/Pepper Data/Shockwave Flash/WritableRoot/";
    aPath.purpose = @"Remediation of Chromium";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/Application Support/SecureMac/";
    aPath.purpose = @"SecureMac to Run";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    aPath = [[Path alloc] init];
    aPath.path = @"~/Library/LaunchAgents/";
    aPath.purpose = @"Remediation of Application Launch Agents";
    aPath.required = @"YES";
    aPath.access = @"No";
    
    [self.pathsController addObject:aPath];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _pathsArray.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSDictionary *paths = self.pathsArray[row];
    if ([tableColumn.identifier isEqualToString:@"required"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"required" owner:self];
        cellView.textField.stringValue = paths[@"Enabled"];
//        cellView.imageView.stringValue = @"";
        return cellView;
    }
    return nil;
}

- (NSView *)TableView:(NSOutlineView *)TableView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    bool isRequiredColumn = [[tableColumn identifier] isEqualToString:@"Required"];
    
    if (!isRequiredColumn)
    {
        return nil;
    }
    
    NSTableCellView *cell = [TableView makeViewWithIdentifier:@"required" owner:self];

    NSButton *enableButton = (NSButton*)enableButton;
    NSString *itemName = [self getItemName:_requiredText];
    [enableButton setTitle:itemName];
    [enableButton setAction:@selector(itemChecked:)];
    
    return cell;
};

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *columnIdentifier = [tableColumn identifier];
    Path *pathArray = [_pathsArray objectAtIndex:row];
    
    return [pathArray valueForKey:columnIdentifier];
}

- (IBAction)itemChecked:(id)sender
{
    NSButton *checkedCellButton = (NSButton*)sender;
    NSString *checkedCellName = [checkedCellButton title];

//    long checkedCellIndex = [_tableView rowForView:sender];
//    id itemAtRow = [_tableView objectA:checkedCellIndex];
//    id parent = [self findParentForItem:itemAtRow];
//
//    if (parent == nil)
//    {
//        NSLog(@"%ld: %@", checkedCellIndex, checkedCellName);
//    }
//    else
//    {
//        NSLog(@"%ld: %@ %@", checkedCellIndex, checkedCellName, parent);
//    }
}

- (id)findParentForItem:(id)item
{
    
    for(id key in _pathsArray)
    {
        //id value = [self.pathsArrays objectForKey:key];
        
//        if (value == parentArray)
//        {
//            return key;
//        }
    }
    
    return nil;
}

- (NSString*)getItemName:(id)item
{
    NSString *itemName;
    
    if ([item isKindOfClass:[NSString class]])
    {
        itemName = item;
    }
    else if ([item isKindOfClass:[NSArray class]])
    {
        NSArray *keys = _pathsArray;

        itemName = [keys objectAtIndex:0];
    }
    else
    {
        itemName = @"";
    }
    
    return itemName;
}

#pragma mark - Table view delegate

- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {

   if([[tableColumn identifier] isEqualTo:@"delete"]){
    NSButtonCell *Required = [[NSButtonCell alloc] init];
    [Required setAllowsMixedState:YES];
    [(NSButtonCell *)Required setButtonType:NSSwitchButton];
    [Required setTitle:@""];

    return Required;

   }else {
    NSCell *cell = [tableColumn dataCell];
    return cell;
   }
}

- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors {
    [_pathsArray sortUsingDescriptors:tableView.sortDescriptors];
    [tableView reloadData];
}

#pragma mark Action methods for Buttons

- (IBAction)enable:(id)sender {
    NSLog(@"enable ");
}
- (IBAction)required:(id)sender {
    NSLog(@"required ");
}

- (IBAction)EnableAccess:(id)sender
{
    NSLog(@"EnableAccess ");
}
- (IBAction)CancelPressed:(id)sender {
    NSLog(@"CancelPressed ");
}

#pragma mark Action methods for Buttons in TableView

- (IBAction)RequiredPressed:(id)sender {
    NSLog(@"RequiredPressed ");
}

- (IBAction)EnablePressed:(id)sender {
    NSLog(@"EnablePressed ");
}

@end
