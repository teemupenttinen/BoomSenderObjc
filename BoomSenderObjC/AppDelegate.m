//
//  AppDelegate.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UINavigationController *nav = [[UINavigationController alloc]init];
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    [nav.navigationBar setBarTintColor: [UIColor colorWithRed:36.0/255.0 green:35.0/255.0 blue:49.0/255.0 alpha:1]];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil]];
    [nav setViewControllers:@[homeViewController]];
    self.window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    [self.window setBackgroundColor:[UIColor colorWithRed:36.0/255.0 green:35.0/255.0 blue:49.0/255.0 alpha:1]];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
