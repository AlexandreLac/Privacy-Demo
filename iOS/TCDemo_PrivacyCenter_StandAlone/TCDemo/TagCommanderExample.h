//
//  TagCommanderExample.h
//  TCDemo Test App
//
//  Created by Damien TERRIER on 4/25/13.
//  Copyright (c) 2013 Damien TERRIER. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TC_SITE_ID 3311
#define TC_PRIVACY_ID 3

@class TagCommander;

@interface TagCommanderExample : NSObject

+ (void) tagcommanderWithSiteID: (int) siteID withContainerID: (int) containerID;

@end
