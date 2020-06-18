//
//  TCFreewheelCallbacks.h
//  TCPartners
//
//  Created by JeanJulien on 06/03/2019.
//  Copyright © 2019 TagCommander. All rights reserved.
//

#ifndef TCFreewheelCallbacks_h
#define TCFreewheelCallbacks_h

#import <Foundation/Foundation.h>

@protocol TCFreewheelCallbacks <NSObject>

@optional
/**
 * Called when we received a responses from Adobe Audience Manager's servers and parsed segments from it.
 * @param segments a map with the segments received and their values.
 */
- (void) onSegmentReceived: (NSDictionary *) segments;

@end

#endif /* TCFreewheelCallbacks_h */
