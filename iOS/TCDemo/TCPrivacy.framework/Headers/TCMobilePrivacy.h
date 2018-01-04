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

@interface TCMobilePrivacy : TCSingleton <ITCEventSenderDelegate>

SINGLETON_CLASS_H(TCMobilePrivacy)

- (void) SetSiteID: (int) siteID;
- (void) enableSDK;
- (void) disableSDK;
- (void) fetchPrivacyPopUp;
- (void) setPrecedenceForCookies;

@property (nonatomic, assign) ETCPrivacyState privacyState;
@property (nonatomic, assign) int clientSiteID;

@property (nonatomic, retain) TCEventSender *senderDelegate;

@end
