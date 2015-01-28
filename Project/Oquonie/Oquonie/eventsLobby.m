//
//  xxiivvViewController+eventsLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "xxiivvTouch.h"

#import "xxiivvViewController.h"
#import "eventsLobby.h"
#import "xxiivvEvents.h"
#import "xxiivvUser.h"
#import "xxiivvWorld.h"

@implementation xxiivvViewController (eventsLobby)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

-(NSString*)event_gateDocument :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterDocument);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( userCharacter == characterDocument && userLocation == 29 ){
			return letterDocument;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==characterDocument){
			return @"gateDocument.open";
		}
		else{
			return @"gateDocument.shut";
		}
	}
	
	// Warp
	if(userCharacter == characterDocument){
		if(userLocation == 29){
			[self eventWarp:@"30" :@"0,-1"];
		}
		else if(userLocation == 30){
			[self eventWarp:@"29" :@"0,1"];
		}
	}
	else{
		[self eventDialog :eventDialogLocked:eventTutorial];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNephtaline :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNephtaline);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if(userCharacter==2 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && userLocation == 1 ){
            return letterUnlocked; // letterUnlocked
        }
        // Nestorine Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNestorine] intValue] != 1 && userLocation == 93 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNephtaline] intValue] != 1 && userLocation == 1 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Nemedique pillar
		if(userLocation == 93 && [userStorageEvents[storageQuestPillarNestorine] intValue] == 1){
			return @"19";
		}
		if(userCharacter==characterNephtaline || userCharacter == 7){
			return @"gateNephtalineOpen";
		}
		else{
			return @"gateNephtalineClosed";
		}
	}
	
	// Nemedique pillar
	if(userLocation == 93 && [userStorageEvents[storageQuestPillarNestorine] intValue] == 1){
		return @"";
	}
	
	// Warp
	if(userCharacter == characterNephtaline || userCharacter == 7){
		if(userLocation == 38){
			[self eventWarp:@"39" :@"0,-1"];
		}
		else if(userLocation == 39){
			[self eventWarp:@"38" :@"0,1"];
		}
		else if(userLocation == 1){
			[self eventWarp:@"40" :@"-1,-1"];
		}
		else if(userLocation == 40){
			[self eventWarp:@"1" :@"1,0"];
		}
		// Nestorine
		else if(userLocation == 93){
			[self eventWarp:@"90" :@"-1,0"];
		}
		else if(userLocation == 90){
			[self eventWarp:@"93" :@"1,0"];
		}
		// Nastalize
		else if(userLocation ==	141){
			[self eventWarpDramatic:@"144":@"-1,0"];
		}
		else if(userLocation == 144){
			[self eventWarp:@"141" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNeomine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if(userCharacter==3 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && userLocation == 3 ){
            return letterUnlocked; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNeomine] intValue] != 1 && userLocation == 3 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==characterNeomine || userCharacter == 7 || userCharacter == 8 ){
			return @"gateNeomineOpen";
		}
		else{
			return @"gateNeomineClosed";
		}
	}
	// Warp
	if(userCharacter == characterNeomine || userCharacter == 7 || userCharacter == 8){
		if(userLocation == 60){
			[self eventWarp:@"3" :@"1,0"];
		}
		else if(userLocation == 3){
			[self eventWarp:@"60" :@"-1,0"];
		}
		else if(userLocation == 34){
			[self eventWarp:@"71" :@"-1,1"];
		}
		else if(userLocation == 71){
			[self eventWarp:@"34" :@"1,1"];
		}
		else if(userLocation == 58){
			[self eventWarp:@"59" :@"-1,0"];
		}
		else if(userLocation == 59){
			[self eventWarp:@"58" :@"1,0"];
		}
		// Nastalize
		else if(userLocation ==	142){
			[self eventWarpDramatic:@"145":@"-1,0"];
		}
		else if(userLocation == 145){
			[self eventWarp:@"142" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNestorine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if(userCharacter==4 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && userLocation == 7 ){
            return letterUnlocked; // letterUnlocked
        }
        // Necomedre Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && userLocation == 34 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNestorine] intValue] != 1 && userLocation == 7 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Condemned pillar doors: Neomine
		if(userLocation == 34 && [userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){
			return @"25";
		}
		if(userCharacter==characterNestorine || userCharacter == 7){
			return @"gateNestorineOpen";
		}
		else{
			return @"gateNestorineClosed";
		}
	}
	
	// Condemned pillar doors: Neomine
	if(userLocation == 34 && [userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){
		return @"";
	}
	
	// Warp
	if(userCharacter == characterNestorine || userCharacter == 7){
		if(userLocation == 7){
			[self eventWarpDramatic:@"96" :@"0,-1"];
		}
		else if(userLocation == [locationNestorineEnter intValue]){
			[self eventWarp:locationNestorineLobby:@"0,1"];
		}
		else if(userLocation == 34){
			[self eventWarp:@"120" :@"-1,0"];
		}
		else if(userLocation == 120){
			[self eventWarp:@"34":@"1,0"];
		}
		else if(userLocation == 69){
			[self eventWarpDramatic:@"70":@"0,-1"];
		}
		else if(userLocation == 70){
			[self eventWarp:@"69":@"0,1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNecomedre :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNecomedre);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter==1 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && userLocation == 5 ){
			return letterUnlocked; // letterUnlocked
        }
        // Neomine Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNeomine] intValue] != 1 && userLocation == 62 ){
            return letterPillar;
        }
        // Nemedique Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 0 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && userLocation == 101 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && userLocation == 5 ){
            return letterPillar; // letterUnlocked
        }
        
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		// Nemedique pillar
		if(userLocation == 101 && [userStorageEvents[storageQuestPillarNemedique] intValue] == 1){
			return @"13";
		}
		// Neomine pillar
		if(userLocation == 62 && [userStorageEvents[storageQuestPillarNeomine] intValue] == 1){
			return @"36";
		}
		
		if(userCharacter==characterNecomedre || userCharacter == 7){
			return @"gateNecomedreOpen";
		}
		else{
			return @"gateNecomedreClosed";
		}
	}
	
	// Condemned pillar doors: Nemedique
	if(userLocation == 101 && [userStorageEvents[storageQuestPillarNemedique] intValue] == 1){
		[self eventWarp:@"105":@"0,-1"];
		return @"";
	}
	// Condemned pillar doors: Neomine
	if(userLocation == 62 && [userStorageEvents[storageQuestPillarNeomine] intValue] == 1){
		return @"";
	}
	
	// Warp
	if(userCharacter == characterNecomedre || userCharacter == 7){
		if(userLocation == 62){
			[self eventWarp:@"71" :@"0,-1"];
		}
		else if(userLocation == 71){
			[self eventWarp:@"62" :@"0,1"];
		}
		else if(userLocation == 5){
			[self eventWarp:@"32" :@"0,-1"];
		}
		else if(userLocation == 32){
			[self eventWarp:@"5" :@"0,1"];
		}
		// Nemedique Pillar
		else if(userLocation == 101){
			[self eventWarp:locationNemediquePillar :@"0,-1"];
		}
		else if(userLocation == [locationNemediquePillar intValue]){
			[self eventWarp:@"101" :@"0,1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNemedique :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if(userCharacter==5 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && userLocation == 9 ){
            return letterUnlocked;
        }
        // Nephtaline Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNephtaline] intValue] != 1 && userLocation == 50 ){
            return letterPillar;
        }
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Nemedique pillar
		if(userCharacter==5 || userCharacter == 7){
			return @"gateNemediqueOpen";
		}
		else{
			return @"gateNemediqueClosed";
		}
	}
	
	// Condemned pillar doors
	if(userLocation == 50 && [userStorageEvents[storageQuestPillarNephtaline] intValue] == 1 && userCharacter == characterNemedique){
		[self eventWarp:@"117" :@"-1,0"];
		return @"";
	}
	
	// Warp
	if(userCharacter == characterNemedique || userCharacter == 7){
		if(userLocation == 50){
			[self eventWarpDramatic:@"121" :@"-1,0"];
			[self eventDialog:dialogInfoPillar:eventOwl];
		}
		else if(userLocation == 121){
			[self eventWarp:@"50" :@"1,0"];
		}
		else if(userLocation == 9){
			[self eventWarp:locationNemediqueEnter :@"-1,0"];
		}
		else if(userLocation == 100){
			[self eventWarp:locationNemediqueLobby :@"1,0"];
		}
		// Nestorine
		else if(userLocation == 94){
			[self eventWarpDramatic:@"92":@"0,-1"];
		}
		else if(userLocation == 92){
			[self eventWarp:@"94" :@"1,0"];
		}
		// Nastalize
		else if(userLocation ==	143){
			[self eventWarpDramatic:@"146":@"-1,0"];
		}
		else if(userLocation == 146){
			[self eventWarp:@"143" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateHiversaires :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [userStorageEvents[storageQuestPillarHiversaires] intValue] == 1){
			return @"41";
		}
		return @"";
	}
	
	if( [userStorageEvents[storageQuestPillarHiversaires] intValue] == 1){
		[self eventWarpDramatic:@"148":@"-1,0"];
	}
	else{
		[self eventDialog:@"123":eventOwl];
	}
	
	return @"";
}

-(NSString*)event_gateCatfish:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter == 7){
			return @"gateCatOpen";
		}
		else{
			return @"gateCatClosed";
		}
	}
	
	// Warp todo: warp to 113(random door warp is missing)
	if(userCharacter == 7){
        if(userLocation == 130){ [self eventWarp:@"131":@"-1,-1"]; }
        else if(userLocation == 131){ [self eventWarp:@"130":@"-1,1"]; }
        else if(userLocation == 112){ [self eventWarp:@"113":@"0,-1"]; }
	}
    else{
        NSString* eventDialogLocked = dialogHaveCharacterNot(letterCat);
        [self eventDialog:eventDialogLocked:eventOwl];
    }
	
	return @"";
}

-(NSString*)event_gateNastazie :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter == 8){
			return @"gateNastazieOpen";
		}
		else{
			return @"gateNastazieClosed";
		}
	}
	
	if(userCharacter == 8){
		if(userLocation == 130){ [self eventWarpDramatic:@"147":@"0,-1"]; }
		else if(userLocation == 147){ [self eventWarp:@"130":@"0,1"]; }
	}
	
	[self eventDialog:@"123":eventOwl];
	
	return @"";
}


-(NSString*)event_gateEnd:(NSString*)option
{
	// count pillars
	int count = 0;
	if([userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNemedique] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNeomine] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNephtaline] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNestorine] intValue] == 1){ count += 1; }
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		if(count == 5){
			return @"gateRedOpen";
		}
		else{
			return @"gateRedClosed";
		}
	}
	
	if(userGameCompleted == 1 && count == 5){
		[self eventWarp:@"115":@"-1,0"];
	}
	else if(count == 5){
		[self eventWarpDramatic:@"104":@"-1,0"];
		[self apiContact:@"oquonie":@"analytics":@"ending":@"1"];
	}
	else{
		[self eventDialog:dialogHavePillarsNot:eventRed];
	}
	
	return @"";
}

-(NSString*)event_warpLobby:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @""; // try with 17 ?
	}
	
	[self eventDialog:dialogWarpLobby:@"1"];
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	
	return @"";
}

-(void)warpLobbyAnimation
{
    userSpriteState = @"warp";
	[self moveAnimation];
	[UIView animateWithDuration:0.5 animations:^(void){
		self.userPlayer.frame = [self tileLocation:4:0:0];
        if( userLocation == 80 ){ // Special warp in Nestorine
            self.userPlayer.frame = [self tileLocation:4:1:1];
        }
    } completion:^(BOOL finished){
		[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(userSave) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(warpLobbyAnimationSpriteUpdate) userInfo:nil repeats:NO];
		[self eventTransitionPan:locationLobbyLanding:roomCenter];
	}];
}

-(void)warpLobbyAnimationSpriteUpdate
{
	[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",userCharacter]];
	userSpriteState = @"warp";
	userSpriteOrientationHorizontal = @"l";
    userSpriteOrientationVertical = @"f";
}

// =======================
// @ Events: Pillars
// =======================

# pragma mark Pillars -

-(NSString*)event_pillar:(NSString*)option
{
	int pillarInstanceStorageId;
	NSString* pillarInstanceWarp;
	
	if(userLocation == [locationNeominePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNeomine;
		pillarInstanceWarp = locationNeomineLobby;
	}
	else if (userLocation == [locationNecomedrePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNecomedre;
		pillarInstanceWarp = locationNecomedreLobby;
	}
	else if (userLocation == [locationNephtalinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNephtaline;
		pillarInstanceWarp = locationNephtalineLobby;
	}
	else if (userLocation == [locationNestorinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNestorine;
		pillarInstanceWarp = locationNestorineLobby;
	}
	else if (userLocation == [locationNemediquePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNemedique;
		pillarInstanceWarp = locationNemediqueLobby;
	}
	// Hiversaires
	else if (userLocation == 147){
		pillarInstanceStorageId = storageQuestPillarHiversaires;
		pillarInstanceWarp = locationNeomineLobby;
	}
		
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [userStorageEvents[pillarInstanceStorageId] intValue] == 1){
			return eventPillarRemains;
		}
		return @"";
	}
	
	// Dialog
	if([userStorageEvents[pillarInstanceStorageId] intValue] != 1){
		userStorageEvents[pillarInstanceStorageId] = @"1";
		[self audioDialogPlayer:@"bump"];
		[self eventDialog:dialogGainPillar:eventOwl];
		[self eventTransitionPan:pillarInstanceWarp:roomCenter];
		// Clear Spellbook
		userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	}
	else{
		userStorageEvents[pillarInstanceStorageId] = @"0";
	}
    
    if(userLocation == [locationNeominePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"neomine-pillar":@"1"];
    }
    else if (userLocation == [locationNecomedrePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"necomedre-pillar":@"1"];
    }
    else if (userLocation == [locationNephtalinePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nephtaline-pillar":@"1"];
    }
    else if (userLocation == [locationNestorinePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nestorine-pillar":@"1"];
    }
    else if (userLocation == [locationNemediquePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nemedique-pillar":@"1"];
    }
    else if (userLocation == 147){
        [self apiContact:@"oquonie":@"analytics":@"hiversaires-pillar":@"1"];
    }
	
	[self roomStart];
	
	// Default
	return @"";
}

-(NSString*)event_socket :(NSString*)option
{
	int socketInstanceStorageId;
	
	if(userLocation == [locationNeomineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNeomine;
	}
	else if(userLocation == [locationNestorineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNestorine;
	}
	else if(userLocation == [locationNecomedreLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNecomedre;
	}
	else if(userLocation == [locationNephtalineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNephtaline;
	}
	else if(userLocation == [locationNemediqueLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNemedique;
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([userStorageEvents[socketInstanceStorageId] intValue] == 1){
			return eventPillarAssembled;
		}
		return @"";
	}
	// Dialogs
	if([userStorageEvents[socketInstanceStorageId] intValue] == 1){
		[self eventDialog:dialogInfoPillar:eventOwl];
	}
	[self audioEffectPlayer:@"bump1"];
	
	// Default
	return @"";
}

-(NSString*)event_map :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if(userLocation == 32){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Necomedre.png"];
	}
	if(userLocation == 2){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Lobby.png"];
	}
	if(userLocation == 60){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Neomine.png"];
	}
	if(userLocation == 50){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Nephtaline.png"];
	}
	if(userLocation == 85){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Nestorine.png"];
	}
	
	[self audioEffectPlayer:@"bump1"];
	[UIView animateWithDuration:1 animations:^(void){
		self.mapImage.alpha = 1;
	} completion:^(BOOL finished){
		[self eventDialog:dialogMapHelp:eventOwl];
	}];
	
	// Default
	return @"";
}

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

// =======================
// @ Events: NPCs
// =======================

# pragma mark NPCs -

-(NSString*)event_redGhost:(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userLocation == 31||userLocation == 36||userLocation == 40|userLocation == 68||userLocation == 86){
			return eventRed;
		}
		return @"";
    }
	
	for (UIImageView *subview in [self.spritesContainer subviews]) {
		if(subview.tag != 20){ continue; }
		int tileId = -1;
		while (tileId < 21) {
			tileId += 1;
			// Lets identify the current subview
			if(![[self tileParser:worldNode[userLocation][tileId] :2] isEqualToString:@"redGhost"]){ continue; }
			if( subview.frame.origin.x != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.x ){ continue;}
			if( subview.frame.origin.y != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.y ){ continue;}
			
			if( userLocation == 31 && [userStorageEvents[storageGhostOffice] intValue] == 1){ subview.alpha = 0; return @"";}
			if( userLocation == 36 && [userStorageEvents[storageGhostNecomedre] intValue] == 1){ subview.alpha = 0; return @"";}
			if( userLocation == 40 && [userStorageEvents[storageGhostNephtaline] intValue] == 1){ subview.alpha = 0; return @"";}
			if( userLocation == 68 && [userStorageEvents[storageGhostNeomine] intValue] == 1){ subview.alpha = 0; return @"";}
			if( userLocation == 86 && [userStorageEvents[storageGhostNestorine] intValue] == 1){ subview.alpha = 0; return @"";}
			
			[self moveDisable:2];
			
			[UIView animateWithDuration:2 animations:^(void){
				[UIView setAnimationDelay:1];
				subview.alpha = 0;
			} completion:^(BOOL finished){}];
            
            
            
            if(userLocation == 31){
                userStorageEvents[storageGhostOffice] = @"1";
            }
            if(userLocation == 36){
                userStorageEvents[storageGhostNecomedre] = @"1";
            }
            if(userLocation == 40){
                userStorageEvents[storageGhostNephtaline] = @"1";
            }
            if(userLocation == 68){
                userStorageEvents[storageGhostNeomine] = @"1";
            }
            if(userLocation == 86){
                userStorageEvents[storageGhostNestorine] = @"1";
            }
		}
	}
	return @"";
}

-(NSString*)event_owlSave :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	// Dialog
    [self eventDialog:dialogOwlSave:eventOwl];
	[self audioDialogPlayer:@"owl"];
	[self userSave];
	
	// Return storage Id
	return @"";
}

-(NSString*)event_shark :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 && userCharacter != 1){ return letterConfused;}
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 || userLocation == 102){
		
		[self audioDialogPlayer:@"shark"];
	
		[self eventDialog:dialogSharkHelp:eventShark];
		[self moveDisable:4];
		[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(event_sharkDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(event_sharkTransform) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		
		// Clear Spellbook
		userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	}
	else{
		[self audioDialogPlayer:@"shark"];
		[self eventDialog:dialogSharkTransform:eventShark];
	}
	
	// Return storage Id
	return @"";
}

-(void)event_sharkDialog
{
	[self eventDialog:dialogSharkTransform:eventShark];
}

-(void)event_sharkTransform
{
	[self eventTranform:1];
}

-(NSString*)event_ramen :(NSString*)option
{
	int ramenStorage;
	
	if( userLocation == [locationNestorineRamen intValue]){
		ramenStorage = storageQuestRamenNestorine;
	}
	else if( userLocation == [locationNeomineRamen intValue]){
		ramenStorage = storageQuestRamenNeomine;
	}
	else if( userLocation == [locationNecomedreRamen intValue]){
		ramenStorage = storageQuestRamenNecomedre;
	}
	else if( userLocation == [locationNephtalineRamen intValue]){
		ramenStorage = storageQuestRamenNephtaline;
	}
	else if( userLocation == [locationNemediqueRamen intValue]){
		ramenStorage = storageQuestRamenNemedique;
	}
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[ramenStorage] intValue] == 0){
			return letterGuide;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Completed
		if([userStorageEvents[ramenStorage] intValue] == 1){
			return eventRamenSeat;
		}
		else{
			return eventRamen;
		}
	}
	
	// Dialogs
	if([userStorageEvents[ramenStorage] intValue] == 0){
		userStorageEvents[ramenStorage] = @"1";
		[self eventWarp:userLocationString:userPositionString];
		[self eventDialog:dialogGainRamen:eventRamen];
		[self audioDialogPlayer:@"ramen"];
	}
	
	return @"";
}

-(NSString*)event_ramenLobby :(NSString*)option
{
	int ramenStorage;
	NSString* saySpell;
	int giveSpell;
	
	// Characters Settings
	if(userCharacter == characterNestorine){
		ramenStorage = storageQuestRamenNestorine;
		saySpell = letterNephtaline;
		giveSpell = spellNephtaline;
	}
	else if(userCharacter == characterNephtaline){
		ramenStorage = storageQuestRamenNephtaline;
		saySpell = letterNemedique;
		giveSpell = spellNemedique;
	}
	else if(userCharacter == characterNecomedre){
		ramenStorage = storageQuestRamenNecomedre;
		saySpell = letterNestorine;
		giveSpell = spellNestorine;
	}
	else if(userCharacter == characterNemedique){
		ramenStorage = storageQuestRamenNemedique;
		saySpell = letterNeomine;
		giveSpell = spellNeomine;
	}
	else if(userCharacter == characterNeomine){
		ramenStorage = storageQuestRamenNeomine;
		saySpell = letterNecomedre;
		giveSpell = spellNecomedre;
	}
	
	if(userGameCompleted ==1){
		[self audioEffectPlayer:@"ramen"];
		return @"";
	}
	
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[ramenStorage] intValue] == 1 && ![self eventSpellCheck:@"ramenQuestSpell"] ){
			return saySpell;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Completed
		if([userStorageEvents[ramenStorage] intValue] == 1){
			return eventRamen;
		}
		else{
			return eventRamenSeat;
		}
	}
	
	if([userStorageEvents[ramenStorage] intValue] == 1){
		[self eventSpellAdd:@"ramenQuestSpell":giveSpell];
		[self audioDialogPlayer:@"ramen"];
	}
	
	return @"";
}

-(NSString*)event_speakerphone :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(self.audioAmbientPlayer.volume<1.0){ return @"22"; }
		else{ return @"9"; }
	}
	
	// Dialogs
	if(self.audioAmbientPlayer.volume<1){
		[self eventAudioToggle:1];
		[self eventDialog:dialogAudioOn:eventAudio];
		[self audioDialogPlayer:@"speakerphone"];
	}
	else{
		[self eventAudioToggle:0];
		[self eventDialog:dialogAudioOff:eventAudio];
		[self audioDialogPlayer:@"speakerphone"];
	}
	
	[self roomStart];
	
	return @"";
}

-(NSString*)event_sauvegarde:(NSString*)option
{
	// lokiva
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventDialog:dialogHiversaires:eventHiversaires];
	
	return @"";
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(NSString*)event_tree :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		// count pillars
		int count = 0;
		if([userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNemedique] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNeomine] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNephtaline] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNestorine] intValue] == 1){ count += 1; }
		
		if(count == 0){ return @"23";}
		if(count == 1){ return @"24";}
		if(count == 2){ return @"25";}
		if(count == 3){ return @"26";}
		if(count >  3){ return @"27";}
		
		return @"";
	}
	// Default
	return @"";
}

-(NSString*)event_null :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Default
	return @"";
}

-(NSString*)event_courtyard:(NSString*)option
{
	// Broadcast Notification |warp|11|1,0
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	if(userGameCompleted ==1){
		[self eventWarpDramatic:@"116":@"1,0"];
	}
	else{
		[self eventWarpDramatic:@"11":@"1,0"];
		
	}
	
	// Default
	return @"";
}

@end
