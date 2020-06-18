#import <UIKit/UIKit.h>
#import <TCPrivacy/TCPrivacyCallbacks.h>

@class TagCommander;

@interface TCAppDelegate : UIResponder <UIApplicationDelegate, TCPrivacyCallbacks>
{
@public
    TagCommander *tc;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TagCommander *tc;

@end
