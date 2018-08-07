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

@class TagCommander;

@interface TCMobilePrivacy : TCSingleton <ITCEventSenderDelegate>

SINGLETON_CLASS_H(TCMobilePrivacy)

- (void) setSiteID: (int) siteID TCInstance: (TagCommander *) tc AndVersion: (NSString *) version;
- (void) setSiteID: (int) siteID TCInstance: (TagCommander *) tc;
- (void) saveConsent: (NSDictionary *) consent;
- (void) setConsentUser: (NSString *) userID;
- (void) viewConsent;
- (void) enableSDK;
- (void) disableSDK;

@property (nonatomic, assign) ETCPrivacyState privacyState;
@property (nonatomic, assign) int clientSiteID;
@property (nonatomic, assign) Boolean consentExpired;
@property (nonatomic, retain) TagCommander *tcInstance;
@property (nonatomic, retain) NSString *consentVersion;
@property (nonatomic, retain) NSString *userID;

@property (nonatomic, retain) TCEventSender *senderDelegate;

@end
