//
//  TCPrivacyConstants.h
//  TCPrivacy
//
//  Created by JeanJulien on 28/12/2017.
//  Copyright © 2017 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef TagCommander_TCPrivacyConstants_h
#define TagCommander_TCPrivacyConstants_h

@interface TCPrivacyConstants : NSObject

extern NSString *const kTCConsentTime;
extern NSString *const kTCPrivacyConsent;

extern NSString *const kTCCategoryPrefix;
extern NSString *const kTCVendorPrefix;
extern NSString *const kTCFeaturePrefix;

extern NSString *const kTCSavedCategories;
extern NSString *const kTCSavedVendors;
extern NSString *const kTCSavedFeatures;

extern unsigned long long const kTCConsentExpirationDuration;

// Privacy Configuration
extern NSString *const kTCConfigurationCDNURLStringFormat;

extern NSString *const kTCVendorListOfflineKey;
extern NSString *const kTCVendorListURL;
extern NSString *const kTCIABVendorList;

// type_actions
extern NSString *const kTCTypeActionViewPrivacyCenter;
extern NSString *const kTCTypeActionSavePrivacyCenter;

// file names
extern NSString *const kTCPublisherRestrictionConfiguration;
extern NSString *const kTCVendorListConfiguration;

// Notifications keys
extern NSString *const kTCUserInfo_ResetSave;

@end

#endif
