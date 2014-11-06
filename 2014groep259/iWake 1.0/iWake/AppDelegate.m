//
//  AppDelegate.m
//  iWake
//
//  Created by Fhict on 25/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        // Assign tab bar item with titles
        UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
        UITabBar *tabBar = tabBarController.tabBar;
        UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
        UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
        UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
        UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
        
        tabBarItem1.title = @"Start";
        tabBarItem2.title = @"Alarm";
        tabBarItem3.title = @"Record";
        tabBarItem4.title = @"Weather";
    
    tabBarItem1.image = [UIImage imageNamed:@"Bookmarks.png"];
    
    tabBarItem2.image = [UIImage imageNamed:@"Alarm.png"];
    
    tabBarItem3.image = [UIImage imageNamed:@"rsz_mic.png"];
    
    tabBarItem4.image = [UIImage imageNamed:@"iCloud.png"];
    
    tabBarItem1.selectedImage = [UIImage imageNamed:@"start_clicked"];
    
    tabBarItem2.selectedImage = [UIImage imageNamed:@"alarm_clicked"];
    
    tabBarItem3.selectedImage = [UIImage imageNamed:@"recorded_clicked"];
    
    tabBarItem4.selectedImage = [UIImage imageNamed:@"weather_clicked"];

    
    //[[UITabBar appearance] setTintColor:[self colorWithHexString:@"eeeeee"]];

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

@end
