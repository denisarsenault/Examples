//
//  AppDelegate.m
//  EventKit
//
//  Created by Denis Arsenault on 16/07/12.
//  Copyright (c) 2023 Securemac. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@interface AppDelegate () {

}

@property (nonatomic, strong) NSDate* date;
@property (readonly) EKEventStore* store;
@property (readonly) NSArray* calendars;
@property (readonly) NSArray* events;

@end

@implementation AppDelegate
@synthesize store = _store;
@synthesize date = _date;
@dynamic calendars;
@dynamic events;

- (NSDate *)date {
    if (_date == nil) {
        [self setDate:[NSDate date]];
    }
    return _date;
}

- (void)setDate:(NSDate *)date {
    NSDateComponents* dateComponents = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    _date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (EKEventStore*) store {
    if (_store == nil) {
        _store = [[EKEventStore alloc] initWithAccessToEntityTypes:EKEntityMaskEvent];
    }
    return _store;
}

- (NSArray*) calendars {
    return [[self store] calendarsForEntityType:EKEntityTypeEvent];
}

+ (NSSet *)keyPathsForValuesAffectingEvents {
    return [NSSet setWithObject:@"date"];
}

- (NSArray *)events {
    
    NSDate* endDate = [self.date dateByAddingTimeInterval:24 * 60 * 60];
    
    NSPredicate* predicate = [self.store predicateForEventsWithStartDate:self.date endDate:endDate calendars:self.calendars];
    
    NSArray* events = [self.store eventsMatchingPredicate:predicate];
    return events;
}

@end
