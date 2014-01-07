//
//  xxiivvViewController+eventsNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvEvents.h"

#import "eventsNecomedre.h"

@implementation xxiivvViewController (eventsNecomedre)

-(int)event_photocopier1 :(NSString*)option
{
	int userStorageEventId = 10;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 1;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"UVW":@"2"];
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopier2 :(NSString*)option
{
	int userStorageEventId = 11;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 1;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"UVW":@"2"];
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopier3 :(NSString*)option
{
	int userStorageEventId = 12;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 1;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"UVW":@"2"];
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopierDoor :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if(userSpriteCharId == 6){
			// Display a text if the right character
			[self eventDialog:@"UVW":@"2"];
		}
		return 0;
	}
	[self eventDialog:@"AAA":@"1"];
	return false;
}

@end
