//
//  TCOperation.h
//  TCPartners
//
//  Created by JeanJulien on 18/10/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCOperation : NSObject

- (id) initWithJson: (NSDictionary *) config;
- (Boolean) validateOperation: (NSString *) datalayer;
- (Boolean) checkIntOperation: (NSString *) value;
- (Boolean) checkStringOperation: (NSString *) value;
- (NSString *) variableToCheck: (NSString *) datalayer;

@property (nonatomic, retain) NSString *variable;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *operation;
@property (nonatomic, retain) NSString *comparison;
@property (nonatomic, assign) int operand;

@end

NS_ASSUME_NONNULL_END
