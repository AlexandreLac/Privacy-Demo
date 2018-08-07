//
//  TCPrivacyController.m
//  TCDemo
//
//  Created by JeanJulien on 03/01/2018.
//  Copyright © 2018 Damien TERRIER. All rights reserved.
//

#import "TCPrivacyController.h"
#import <TCPrivacy/TCMobilePrivacy.h>

@implementation TCPrivacyController

- (void) switchToggled: (id) sender
{
    UISwitch *mySwitch = (UISwitch *) sender;

    if ([mySwitch isOn])
    {
        NSMutableDictionary *consent = [[NSMutableDictionary alloc] initWithCapacity: 3];
        [consent setObject: @"1" forKey: @"PRIVACY_CAT_1"];
        [consent setObject: @"1" forKey: @"PRIVACY_CAT_2"];
        [consent setObject: @"0" forKey: @"PRIVACY_CAT_3"];
        [[TCMobilePrivacy sharedInstance] saveConsent: consent];
    }
    else
    {
        NSMutableDictionary *consent = [[NSMutableDictionary alloc] initWithCapacity: 3];
        [consent setObject: @"0" forKey: @"PRIVACY_CAT_1"];
        [consent setObject: @"0" forKey: @"PRIVACY_CAT_2"];
        [consent setObject: @"0" forKey: @"PRIVACY_CAT_3"];
        [[TCMobilePrivacy sharedInstance] saveConsent: consent];
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.privacySwitch addTarget: self
                           action: @selector(switchToggled:)
                 forControlEvents: UIControlEventTouchUpInside];
}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
    [[TCMobilePrivacy sharedInstance] viewConsent];
}

@end
