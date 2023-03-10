//
//  PreferencePane.m
//  PreferencePane
//
//  Created by Denis Arsenault on 4/04/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "PreferencePane.h"

@implementation PreferencePane
@synthesize checkbox;

- (void)mainViewDidLoad
{
    NSDictionary* preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.oreilly.MyAmazingApplication"];
    
    self.checkbox.state = [[preferences objectForKey:@"isChecked"] boolValue];
}

- (void)didUnselect 

{
    NSDictionary* preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.oreilly.MyAmazingApplication"];
    
    NSMutableDictionary* mutablePreferences = [NSMutableDictionary dictionaryWithDictionary:preferences];
    
    [mutablePreferences setObject:[NSNumber numberWithBool:self.checkbox.state] forKey:@"isChecked"];
    
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:mutablePreferences forName:@"com.oreilly.MyAmazingApplication"];
}

@end
