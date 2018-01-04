#import <MacTypes.h>
#import "TCRestaurantDetailViewController.h"
#import "TagCommanderExample.h"
#import <TCSDK/TCSDK.h>

@implementation TCRestaurantDetailViewController
@synthesize locationView;
@synthesize smallPopupView;
@synthesize detailItem;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
//    self.webView2 = [[UIWebView alloc] initWithFrame: self.view.frame];
//    [self.webView2 setUserInteractionEnabled: true];
//    [self.webView2 setMultipleTouchEnabled: true];
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];

    self.webView = [[WKWebView alloc] initWithFrame: self.view.frame configuration: theConfiguration];
//    [self.webView setNavigationDelegate: self];
//    [self.webView setUIDelegate: self];
    [self.webView setUserInteractionEnabled: true];
//    [self.webView setAllowsBackForwardNavigationGestures: true];
//    [self.webView setExclusiveTouch: true];
    [self.webView setMultipleTouchEnabled: true];

    NSURL *nsurl = [NSURL URLWithString: @"http://marieetpierre.com/jjz.html"];
    NSURLRequest *nsrequest = [NSURLRequest requestWithURL: nsurl];
    [self.webView loadRequest: nsrequest];

//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"No network connection"
//                                                    message: @"You must be connected to the internet to use this app."
//                                                   delegate: nil
//                                          cancelButtonTitle: @"OK"
//                                          otherButtonTitles: nil];
//    [alert show];
//    [self.webViewContainer addSubview: self.webView];
//    [self.webView2 loadRequest: nsrequest];
//    [self.webViewContainer addSubview: self.webView2];
//    [self saveHTTPCookies];
}

- (void) loadHTTPCookies
{
    NSMutableArray* cookieDictionary = [[NSUserDefaults standardUserDefaults] valueForKey: @"cookieArray"];
    
    for (int i = 0; i < cookieDictionary.count; i++)
    {
        NSMutableDictionary* cookieDictionary1 = [[NSUserDefaults standardUserDefaults] valueForKey: [cookieDictionary objectAtIndex: i]];
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties: cookieDictionary1];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie: cookie];
    }
}

- (void) saveHTTPCookies
{
    NSMutableArray *cookieArray = [[NSMutableArray alloc] init];
    NSLog(@"Cookies:\n");
    for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
    {
        [cookieArray addObject: cookie.name];
        NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
        [cookieProperties setObject: cookie.name forKey: NSHTTPCookieName];
        [cookieProperties setObject: cookie.value forKey: NSHTTPCookieValue];
        [cookieProperties setObject: cookie.domain forKey: NSHTTPCookieDomain];
        [cookieProperties setObject: cookie.path forKey: NSHTTPCookiePath];
        [cookieProperties setObject: [NSNumber numberWithUnsignedInteger:cookie.version] forKey: NSHTTPCookieVersion];
        [cookieProperties setObject: [[NSDate date] dateByAddingTimeInterval: 2629743] forKey: NSHTTPCookieExpires];
        
//        [[NSUserDefaults standardUserDefaults] setValue: cookieProperties forKey: cookie.name];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"%@: %@", cookie.name, cookieProperties);
    }
    
//    [[NSUserDefaults standardUserDefaults] setValue: cookieArray forKey: @"cookieArray"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
}

//- (void) webView: (WKWebView *) webView decidePolicyForNavigationAction: (WKNavigationAction *) navigationAction decisionHandler: (void (^) (WKNavigationActionPolicy)) decisionHandler
//{
//    NSLog(@"JJ: decidePolicyForNavigationAction ? ");
//
//        decisionHandler(WKNavigationActionPolicyAllow);
////        decisionHandler(WKNavigationActionPolicyCancel);
//}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
    [self configureView];

    NSString *screenName = [TagCommanderExample buildPageNameWithChapter: @"Restaurant"
                                                              subChapter: self.detailTitleLabel.text
                                                                  screen: @"Description"
                                                                andClick: @""];
    [TagCommanderExample sendScreenEvent: screenName
                          withRestaurant: self.detailTitleLabel.text
                               andRating: [NSString stringWithFormat: @"%d", (int) (self.detailRatingSlider.value)]];
    
//    [[TagCommanderExample getTagcommander] disableSDK];
}

#pragma mark - Managing the detail item

- (void) setDetailItem: (NSMutableDictionary *) newDetailItem
{
    if (detailItem != newDetailItem)
    {
        detailItem = newDetailItem;
        [self configureView];
    }
}

// Update the user interface for the detail item.
- (void) configureView
{
    if (self.detailItem)
    {
        self.detailTitleLabel.text = self.detailItem[@"name"];
        self.detailTypeLabel.text = self.detailItem[@"type"];
        
        float rating = [self.detailItem[@"rating"] floatValue];
        self.detailRatingSlider.value = rating ;
        
        float waiting = [self.detailItem[@"waitingtime"] floatValue];
        self.detailWaitingSlider.value = waiting;

        NSArray *photos = self.detailItem[@"photos"];

        if (photos)
        {
            NSDictionary *firstPhoto = photos[0];
            UIImage *image = [TCRestaurants getImage: firstPhoto];

            self.imageView.image = image;
        }
    }
}

- (IBAction)ratingSliderChanged:(UISlider *)sender
{
}

- (IBAction) waitingSliderChanged: (UISlider *) sender
{
}

- (void) viewDidUnload
{
    [self setDetailTitleLabel: nil];
    [self setDetailTypeLabel: nil];
    [self setSendDetailButton: nil];
    [self setCancelDetailButton: nil];
    [self setLocationDetailButton: nil];
    [self setDetailRatingSlider: nil];
    [self setImageView: nil];
}

- (IBAction) cancelDetail: (id) sender
{
    [[self navigationController] popViewControllerAnimated: YES];
}

- (IBAction) sendDetail: (id) sender
{
    [[self navigationController] popViewControllerAnimated: YES];
}

- (IBAction) doneEditing: (id) sender
{
    [sender resignFirstResponder];
    [sender endEditing: YES];
}

- (void) releaseButAction: (UIGestureRecognizer *) gestureRecognizer
{
    [smallPopupView removeFromSuperview];
}

- (void) configureSmallPopupView
{
    smallPopupView = [[UIView alloc] initWithFrame: CGRectMake(25, 175, 275, 175)];
    smallPopupView.alpha = 0.0;
    smallPopupView.layer.cornerRadius = 5;
    smallPopupView.layer.borderWidth = 1.5f;
    //customView.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), YourColorValues);
    smallPopupView.layer.masksToBounds = YES;
}

- (void) addGestureToSmallPopupView: (UIView *) theSmallPopupView
{
    UITapGestureRecognizer *touchOnView = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(releaseButAction:)];
    
    [touchOnView setNumberOfTapsRequired: 1];
    [touchOnView setNumberOfTouchesRequired: 1];
    [touchOnView setDelegate: self];
    
    [theSmallPopupView addGestureRecognizer: touchOnView];
}

- (MKCoordinateRegion) ajustedRegion
{
    NSNumber * latitude = @48.8708F;
    NSNumber * longitude = @2.3245F;
    CLLocationCoordinate2D location;
    location.latitude = latitude.doubleValue;
    location.longitude = longitude.doubleValue;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 100, 100);
    MKCoordinateRegion adjustedRegion = [locationView regionThatFits: viewRegion];
    return adjustedRegion;
}

- (void) animateSmallPopupView
{
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: 0.4];
    [smallPopupView setAlpha: 1.0];
    [UIView commitAnimations];
    [UIView setAnimationDuration: 0.0];
}

- (IBAction) locationTap: (id) sender
{
    [self configureSmallPopupView];
    [self addGestureToSmallPopupView: smallPopupView];
    
    [locationView setRegion: [self ajustedRegion] animated: YES];
    [smallPopupView addSubview: locationView];
    [self.view addSubview: smallPopupView];

    [self animateSmallPopupView];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
