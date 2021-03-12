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
#import <TCSDK/TagCommander.h>
#import <TCPrivacy/TCMobilePrivacy.h>
#import <TCPrivacy/TCPrivacyAPI.h>
#import <TCIAB/TCIAB-Swift.h>

@implementation TagCommanderExample

+ (TagCommander *) tagcommanderWithSiteID: (int) siteID
                          withContainerID: (int) containerID
{
    [TCDebug setDebugLevel: TCLogLevel_Info];
    [TCDebug setNotificationLog: YES];

    TagCommander *tc = [[TagCommander alloc] initWithSiteID: siteID andContainerID: containerID];
    
    /**
     * If you need to use your own bundle, please use this for each configuration requiring a specific bundle.
     */
//    [[TCConfigurationFileFactory sharedInstance] setBundle: myBundle forConfiguration: @"vendorlist"];
    
    [[TCMobilePrivacy sharedInstance] setSiteID: 3311 containerID: 7 privacyID: 320 andTCInstance: tc];
    [[TCMobilePrivacy sharedInstance] setLanguage: @"fr"];
    [[TCMobilePrivacy sharedInstance] useCustomPublisherRestrictions];

    [[TCLogger sharedInstance] logMessage: [NSString stringWithFormat: @"saved Consent String: %@",
     [TCCMPStorage getConsentString]] withLevel: TCLogLevel_Error];

    return tc;
}

+ (TagCommander *) tagcommander
{
    return [self tagcommanderWithSiteID: TC_SITE_ID withContainerID: TC_CONTAINER_ID];
}

+ (TagCommander *) getTagcommander
{
    TCAppDelegate *appDelegate = (TCAppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate->tc;
}

+ (NSString *) buildPageNameWithChapter: (NSString *) chapter subChapter: (NSString *) subChapter screen: (NSString *) screen andClick: (NSString *) click
{
    if (chapter == nil) chapter = @"";
    if (subChapter == nil) subChapter = @"";
    if (screen == nil) screen = @"";

    if (click != nil && ![click isEqualToString: @""])
    {
        click = [NSString stringWithFormat: @"--%@", click];
    }

    return [NSString stringWithFormat: @"%@::%@::%@%@", chapter, subChapter, screen, click];
}

/**
 * SendPageEvent is your classic send Hit event.
 * Sending a hit that the user arrived on the page named "pageName"
 *
 * What we do is that we simply tells TagCommander
 * what are the values of the desired parameters so that it can work
 */
+ (void) sendScreenEvent: (NSString *) pageName withRestaurant: (NSString *) restaurant andRating: (NSString *) rating
{
    TagCommander *tc = [[self class] getTagcommander];

    [tc addData: @"#PAGE_NAME#" withValue: pageName];
    [tc addData: @"#RATING#" withValue: rating];
    [tc addData: @"#version#" withValue:
      [NSString stringWithFormat: @"%d", [[TCConfigurationFileFactory sharedInstance] getConfigurationFile: @"vendorList"].version]];
    [tc addData: @"#RESTAURANT_NAME#" withValue: restaurant];

    [tc sendData];
}

/**
 * SendEventClick is your classic click action.
 * Sending a click that the user arrived on the page named "pageName"
 *
 * What we do is that we simply tells TagCommander
 * what are the values of the desired parameters so that it can work
 */
+ (void) sendClickEvent: (NSString *) pageName forClick: (NSString *) clickType withRestaurant: (NSString *) restaurant andRating: (NSString *) rating
{
    TagCommander *tc = [[self class] getTagcommander];

    [tc addData: @"#EVENT#" withValue: @"click"];
    [tc addData: @"#CLICK_TYPE#" withValue: clickType];
    [tc addData: @"#RATING#" withValue: rating];
    [tc addData: @"#PAGE_NAME#" withValue: pageName];
    [tc addData: @"#RESTAURANT_NAME#" withValue: restaurant];
    
    [tc sendData];
}
@end
