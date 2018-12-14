//
//  TCPrivacyCallbacks.h
//  TCPrivacy
//
//  Created by JeanJulien on 23/10/2018.
//  Copyright © 2018 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCPrivacyCallbacks <NSObject>

@optional
/**
 * Called either when parsing data from "saveConsent" or when the SDK is loading and privacy was previously saved.
 * @param consent a dictionnary with the categories and if they are accepted or not.
 */
- (void) consentUpdated: (NSDictionary *) consent;

@optional
/**
 * Called when the user consent hasn't changed in 13 months.
 */
- (void) consentOutdated;

@end
