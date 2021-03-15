//
//  TCSegment.h
//  TCPartners
//
//  Created by JeanJulien on 18/10/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCSegment : NSObject

- (id) initWithJson: (NSDictionary *) config;
- (Boolean) validateSegment: (NSString *) datalayer;

@property (nonatomic, retain) NSString *segName;
@property (nonatomic, retain) NSMutableArray *operations;

@end

NS_ASSUME_NONNULL_END
