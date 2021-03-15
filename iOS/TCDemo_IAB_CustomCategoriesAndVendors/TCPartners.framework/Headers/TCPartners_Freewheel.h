//
//  TCPartners_Freewheel.h
//  TCPartners
//
//  Created by JeanJulien on 22/02/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#import "TCMobilePartners.h"
#import "ITCMobilePartnerProtocol.h"
#import "TCFreewheelCallbacks.h"

@interface TCPartners_Freewheel : TCMobilePartners<ITCMobilePartnerProtocol>

SINGLETON_CLASS_H(TCPartners_Freewheel)

@property (nonatomic, retain) NSString *domain;
@property (nonatomic, retain) id<TCFreewheelCallbacks> callback;

@end
