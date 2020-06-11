//
//  AppDelegate.m
//  CustomerSlider
//
//  Created by yuanshi on 2020/6/11.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       [self.window makeKeyAndVisible];
       
       ViewController *controller = [ViewController new];
       self.window.rootViewController = controller;
    return YES;
}


 

@end
