//
//  TagCommanderExample.m
//
//  Created by Damien TERRIER on 4/25/13.
//  Copyright (c) 2013 Damien TERRIER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagCommanderExample.h"
#import "TCAppDelegate.h"
#import <TCCore/TCDebug.h>
#import <TCCore/TCLogger.h>
#import <TCCore/TCConfigurationFileFactory.h>
#import <TCPrivacy/TCMobilePrivacy.h>
#import <TCPrivacy/TCPrivacyAPI.h>

@implementation TagCommanderExample

+ (void) tagcommanderWithSiteID: (int) siteID withContainerID: (int) containerID
{
    [TCDebug setDebugLevel: TCLogLevel_Info];
    [TCDebug setNotificationLog: YES];

    /**
     * If you need to use your own bundle, please use this for each configuration requiring a specific bundle.
     */
//    [[TCConfigurationFileFactory sharedInstance] setBundle: myBundle forConfiguration: @"privacy"];
    
    [[TCMobilePrivacy sharedInstance] setSiteID: 3311 andPrivacyID: 320];
}

@end
