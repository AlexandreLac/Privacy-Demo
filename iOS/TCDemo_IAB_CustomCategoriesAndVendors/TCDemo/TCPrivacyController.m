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
    TCIABPrivacyCenterViewController *PCM = [[TCIABPrivacyCenterViewController alloc] init];
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
