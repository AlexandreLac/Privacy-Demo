//
//  TCOfflineSegments.h
//  TCPartners
//
//  Created by JeanJulien on 17/10/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCOfflineSegments : NSObject

- (id) initWithConfiguration: (NSString *) configuration;
- (void) computeSegmentList: (NSString *) datalayer;

@property (nonatomic, retain) NSMutableArray *segments;
@property (nonatomic, retain) NSString *lastSegments;

@end

NS_ASSUME_NONNULL_END
