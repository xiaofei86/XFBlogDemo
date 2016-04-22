//
//  AppDelegate.m
//  LPNavigationController
//
//  Created by XuYafei on 16/4/13.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "AppDelegate.h"

#import "LPHiddenNavigationController.h"
#import "LPOpaqueNavigationController.h"
#import "LPTranslucentNavigationController.h"
#import "LPBaseNavigationController.h"

#import "HiddenViewController.h"
#import "OpaqueViewController.h"
#import "TranslucentViewController.h"
#import "ViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    LPHiddenNavigationController *vc0 = [[LPHiddenNavigationController alloc]
                                         initWithRootViewController:[HiddenViewController new]];
    LPOpaqueNavigationController *vc1 = [[LPOpaqueNavigationController alloc]
                                         initWithRootViewController:[OpaqueViewController new]];
    LPTranslucentNavigationController *vc2 = [[LPTranslucentNavigationController alloc]
                                              initWithRootViewController:[TranslucentViewController new]];
    UINavigationController *vc3 = [[UINavigationController alloc]
                                   initWithRootViewController:[ViewController new]];
    tabBarController.viewControllers = @[vc0, vc1, vc2, vc3];
    
    tabBarController.viewControllers[0].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Hidden"
                                                                                   image:nil
                                                                           selectedImage:nil];
    tabBarController.viewControllers[1].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Opaque"
                                                                                   image:nil
                                                                           selectedImage:nil];
    tabBarController.viewControllers[2].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Translucent"
                                                                                   image:nil
                                                                           selectedImage:nil];
    tabBarController.viewControllers[3].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Native"
                                                                                   image:nil
                                                                           selectedImage:nil];
    
    _window.rootViewController = tabBarController;
    
    return YES;
}

@end
