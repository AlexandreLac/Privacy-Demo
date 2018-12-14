//
//  TCMobilePrivacy.h
//  TCPrivacy
//
//  Created by JeanJulien on 28/12/2017.
//  Copyright © 2017 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TCCore/ETCPrivacyState.h>
#import <TCCore/TCSingleton.h>
#import <TCCore/TCMacros.h>
#import <TCCore/TCEventSender.h>
#import <TCCore/TCEventListener.h>
#import "TCPrivacyCallbacks.h"

@class TagCommander;

@interface TCMobilePrivacy : TCSingleton <ITCEventSenderDelegate, ITCEventListenerDelegate>

SINGLETON_CLASS_H(TCMobilePrivacy)

- (void) setSiteID: (int) siteID privacyID: (int) privacyID TCInstance: (TagCommander *) tc andVersion: (NSString *) version;
- (void) setSiteID: (int) siteID privacyID: (int) privacyID andTCInstance: (TagCommander *) tc;
- (void) setSiteID: (int) siteID privacyID: (int) privacyID andVersion: (NSString *) version;
- (void) setSiteID: (int) siteID andPrivacyID: (int) privacyID;

- (void) saveConsent: (NSDictionary *) consent;
- (void) setConsentUser: (NSString *) userID;
- (void) viewConsent;
- (void) enableSDK;
- (void) disableSDK;
- (void) registerCallback: (id<TCPrivacyCallbacks>) listener;

- (void) saveCustomCategoriesInSharedPreferences: (NSDictionary *) consent;

@property (nonatomic, assign) ETCPrivacyState privacyState;
@property (nonatomic, assign) int clientSiteID;
@property (nonatomic, assign) int privacyID;
@property (nonatomic, assign) Boolean consentExpired;
@property (nonatomic, retain) TagCommander *tcInstance;
@property (nonatomic, retain) NSString *consentVersion;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) id<TCPrivacyCallbacks> callback;

@property (nonatomic, retain) TCEventSender *senderDelegate;
@property (nonatomic, retain) TCEventListener *listenerDelegate;

@end
