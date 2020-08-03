//
//  TCPartners_AdobeAudienceManager.h
//  TCPartners
//
//  Created by JeanJulien on 20/02/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#import "TCMobilePartners.h"
#import "ITCMobilePartnerProtocol.h"
#import <TCCore/TCEventSender.h>
#import "TCOfflineSegments.h"

@interface TCPartners_AdobeAudienceManager : TCMobilePartners<ITCEventSenderDelegate, ITCMobilePartnerProtocol>

SINGLETON_CLASS_H(TCPartners_AdobeAudienceManager)

- (void) addOfflineConfigurationForSiteID: (int) siteID andContainerID: (int) containerID;
- (void) setDataSourceID: (int) dataSourceID andPlatformID: (int) platformID;
- (void) initSegmentation;

@property (nonatomic, assign) int dataSourceID;
@property (nonatomic, retain) NSString *IDFA;
@property (nonatomic, retain) NSMutableArray *partners;
@property (nonatomic, retain) NSString *AAMUrl;
@property (nonatomic, retain) TCEventSender *senderDelegate;
@property (nonatomic, retain) TCOfflineSegments *segments;

@end
