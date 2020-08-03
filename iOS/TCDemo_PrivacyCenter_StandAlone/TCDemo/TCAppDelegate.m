#import <TCCore/TCCore.h>
#import "TCAppDelegate.h"
#import "TagCommanderExample.h"
#import <TCPrivacy/TCMobilePrivacy.h>
#import <TCPrivacy/TCPrivacyAPI.h>

@implementation TCAppDelegate

@synthesize tc;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
    [[TCMobilePrivacy sharedInstance] registerCallback: self];
    [TagCommanderExample tagcommanderWithSiteID: TC_SITE_ID withContainerID: TC_PRIVACY_ID];

    return YES;
}

- (void) consentUpdated: (NSDictionary *) consent
{
    // Pass information to your other solutions from here.
    for (NSString *key in consent)
    {
        NSString *value = consent[key];
        [[TCLogger sharedInstance] logMessage: [NSString stringWithFormat: @"callback: %@:%@", key, value]
                                    withLevel: TCLogLevel_Error];
    }
}

- (void) consentOutdated
{
    // Use this to know that it's time to display privacy center again.
}

- (void) consentCategoryChanged
{
    
}

- (void) onSegmentReceived: (NSDictionary *) segments
{
    for (NSString *key in segments)
    {
        NSString *value = segments[key];
        [[TCLogger sharedInstance] logMessage: [NSString stringWithFormat: @"onSegmentReceived: %@:%@", key, value]
                                    withLevel: TCLogLevel_Error];
    }
}

- (void) application: (UIApplication*) application didRegisterForRemoteNotificationsWithDeviceToken: (NSData*) deviceToken
{
}

- (void) application: (UIApplication *) application didReceiveRemoteNotification: (NSDictionary *) userInfo
{
}

- (void) application: (UIApplication*) application didFailToRegisterForRemoteNotificationsWithError: (NSError*) error
{
}

- (void) applicationWillResignActive: (UIApplication *) application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void) applicationWillTerminate: (UIApplication *) application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
