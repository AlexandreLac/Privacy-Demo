//
//  TCPrivacyController.m
//  TCDemo
//
//  Created by JeanJulien on 03/01/2018.
//  Copyright © 2018 Damien TERRIER. All rights reserved.
//

#import "TCPrivacyController.h"
#import <TCPrivacy/TCMobilePrivacy.h>
#import <TCPrivacy/TCPrivacyCenterViewController.h>

@implementation TCPrivacyController

- (void) buttonToggled: (id) sender
{
    TCPrivacyCenterViewController *PCM = [[TCPrivacyCenterViewController alloc] init];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle: [PCM getSaveButtonText]
                                                                   style: UIBarButtonItemStylePlain
                                                                  target: nil
                                                                  action: nil];

    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController: PCM animated: YES];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.displayPrivacySwitch addTarget: self
                                  action: @selector(buttonToggled:)
                        forControlEvents: UIControlEventTouchUpInside];
}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
}

@end
