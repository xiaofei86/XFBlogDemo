//
//  AppDelegate.m
//  XFNavigationController
//
//  Created by 徐亚非 on 2016/10/28.
//  Copyright © 2016年 XuYafei. All rights reserved.
//

#import "AppDelegate.h"

#import "XFHiddenNavigationController.h"
#import "XFOpaqueNavigationController.h"
#import "XFTranslucentNavigationController.h"
#import "XFBaseNavigationController.h"

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
    XFHiddenNavigationController *vc0 = [[XFHiddenNavigationController alloc]
                                         initWithRootViewController:[HiddenViewController new]];
    XFOpaqueNavigationController *vc1 = [[XFOpaqueNavigationController alloc]
                                         initWithRootViewController:[OpaqueViewController new]];
    XFTranslucentNavigationController *vc2 = [[XFTranslucentNavigationController alloc]
                                              initWithRootViewController:[TranslucentViewController new]];
    UINavigationController *vc3 = [[UINavigationController alloc]
                                   initWithRootViewController:[ViewController new]];
    tabBarController.viewControllers = @[vc0, vc1, vc2, vc3];
    
    UIImage *image = [UIImage imageNamed:@"blog_item"];
    tabBarController.viewControllers[0].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Hidden"
                                                                                   image:image
                                                                           selectedImage:nil];
    tabBarController.viewControllers[1].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Opaque"
                                                                                   image:image
                                                                           selectedImage:nil];
    tabBarController.viewControllers[2].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Translucent"
                                                                                   image:image
                                                                           selectedImage:nil];
    tabBarController.viewControllers[3].tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Native"
                                                                                   image:image
                                                                           selectedImage:nil];
    tabBarController.tabBar.tintColor = [UIColor colorWithRed:38/255.0 green:28/255.0 blue:18/255.0 alpha:1];
    
    _window.rootViewController = tabBarController;
    
    return YES;
}

@end

