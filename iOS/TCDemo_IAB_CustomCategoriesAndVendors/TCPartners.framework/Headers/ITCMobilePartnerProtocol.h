//
//  ITCMobilePartnerProtocol.h
//  TCPartners
//
//  Created by JeanJulien on 26/02/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#ifndef ITCMobilePartnerProtocol_h
#define ITCMobilePartnerProtocol_h

#import <Foundation/Foundation.h>

/**
 * @protocol ITCMobilePartnerProtocol
 *
 */
@protocol ITCMobilePartnerProtocol <NSObject>

/**
 * Treat the hit depending on the vendor.
 * @param stringExtra the information to treat.
 */
- (void) treatHit: (NSString *) stringExtra;

/**
 * Treat the server's response. Should be needed by all partners created here since we could otherwise do
 * a normal server-side implementation.
 * @param response the response's body.
 */
- (void) treatResponse: (NSString *) response;

/**
 * Simply return the partner's name, this function allow a compile declaration of a getter on the partner's name.
 */
- (NSString *) getMobilePartnerName;

@end

#endif /* ITCMobilePartnerProtocol_h */
