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
        [[TCMobilePrivacy sharedInstance] enableSDK];
    }
    else
    {
        [[TCMobilePrivacy sharedInstance] disableSDK];
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.privacySwitch addTarget: self
                           action: @selector(switchToggled:)
                 forControlEvents: UIControlEventTouchUpInside];
}

@end
