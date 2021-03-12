//
//  TCMobilePartners.h
//  TCPartners
//
//  Created by JeanJulien on 20/02/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#ifndef HH_TCMOBILEPARTNERS_HH
#define HH_TCMOBILEPARTNERS_HH

#import <Foundation/Foundation.h>
#import "ITCMobilePartnerProtocol.h"
#import <TCCore/TCEventListener.h>
#import "ETCPartnerType.h"
#import <TCCore/TCMacros.h>
#import <TCCore/TCSingleton.h>

@class TCDynamicStore;

@interface TCMobilePartners : TCSingleton<ITCEventListenerDelegate, ITCMobilePartnerProtocol>

- (id) initWithPartnerName: (NSString *) partner;

- (void) activateOnAllHits;
- (void) activateOnKey: (NSString *) key;
- (void) activateOnKey: (NSString *) key andValue: (NSString *) value;
- (void) activateOnAllHitsButKey: (NSString *) key;
- (void) activateOnAllHitsButKey: (NSString *) key andValue: (NSString *) value;
    
- (TCDynamicStore *) extraToStore: (NSString *) extra;
- (NSString *) extractValue: (NSString *) extra FromKey: (NSString *) key;

- (Boolean) checkTreatHit: (NSString *) data;

@property (nonatomic, assign) ETCPartnerType partnerType;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *partnerName;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, assign) Boolean initialized;
@property (nonatomic, retain) NSString *additionalInformation;
    
@property (nonatomic, retain) TCEventListener *listenerDelegate;

@end

#endif //HH_TCMOBILEPARTNERS_HH
