//
//  AppDelegate.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "AppDelegate.h"
#import "ConsumerSurveyViewController.h"
#import "ContactsViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]] autorelease];
    //Override point for customization after application launch
    self.viewController = [[ViewController alloc] init];
    self.viewController.delegate = self;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) userIsLoggedIn
{
    [self createTabs];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
}

- (void) createTabs
{
    UIViewController *temp;
    NSString *tabText;
    NSMutableArray *arrayOfTempViewControllers = [[NSMutableArray alloc] init];
    
    for(int i = 0; i <= 2; i++)
    {
        switch (i)
        {
            case 0:
                temp = [[ConsumerSurveyViewController alloc] init];
                tabText = [[NSString alloc] initWithString:@"Consumer Survey"];
                break;
                
            case 1:
                temp = [[ContactsViewController alloc] init];
                tabText = [[NSString alloc] initWithString:@"Contacts"];
                break;
                
            case 2:
                temp = [[ConsumerSurveyViewController alloc] init];
                tabText = [[NSString alloc] initWithString:@"Consumer Survey"];
                break;
                
            default:
                break;
        }
        
        temp.tabBarItem.title = tabText;
        [arrayOfTempViewControllers addObject:temp];
    
        if(temp != nil)
        {
            [temp release];
            temp = nil;
        }
        
        if(tabText != nil)
        {
            [tabText release];
            tabText = nil;
        }
    }
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = arrayOfTempViewControllers;
    
    //self.tabController.selectedIndex = 22;
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    [arrayOfTempViewControllers removeAllObjects];
    [arrayOfTempViewControllers release];
    arrayOfTempViewControllers = nil;
}

@end

