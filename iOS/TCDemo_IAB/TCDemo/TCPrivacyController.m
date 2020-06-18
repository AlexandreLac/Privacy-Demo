//
//  TCPrivacyController.m
//  TCDemo
//
//  Created by JeanJulien on 03/01/2018.
//  Copyright © 2018 Damien TERRIER. All rights reserved.
//

#import "TCPrivacyController.h"
#import <TCPrivacy/TCMobilePrivacy.h>
#import <TCIAB/TCIAB-Swift.h>
#import <TCPrivacy/TCIABPrivacyCenterViewController.h>

@implementation TCPrivacyController

- (void) buttonClicked: (id) sender
{
//    NSMutableDictionary *consent = [[NSMutableDictionary alloc] init];
//    [consent setValue: @"1" forKey: @"PRIVACY_CAT_1"];
//    [consent setValue: @"1" forKey: @"PRIVACY_CAT_2"];
//    [consent setValue: @"1" forKey: @"PRIVACY_CAT_4"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_45"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_15"];
//    [consent setValue: @"1" forKey: @"PRIVACY_CAT_11"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_5"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_44"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_141"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_111"];
//    [consent setValue: @"1" forKey: @"PRIVACY_VEN_61"];
//    [[TCMobilePrivacy sharedInstance] saveConsent: consent];

    TCIABPrivacyCenterViewController *PCM = [[TCIABPrivacyCenterViewController alloc] init];
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle: [PCM getSaveButtonText]
//                                                                   style: UIBarButtonItemStylePlain
//                                                                  target: nil
//                                                                  action: nil];
////
//    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController: PCM animated: NO];
}

- (void) viewDidLoad
{

    [super viewDidLoad];
    [self.privacyBTN addTarget: self
                        action: @selector(buttonClicked:)
              forControlEvents: UIControlEventTouchUpInside];
}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
}

@end
