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
extern NSString *const kTCSavedCategories;

extern unsigned long long const kTCConsentExpirationDuration;

@end

#endif
