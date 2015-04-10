//
//  AppDelegate.m
//  WatchKitExample
//
//  Created by Kuragin Dmitriy on 09/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import "AppDelegate.h"

#import <ApiAI/ApiAI.h>
#import <ApiAI/AIDefaultConfiguration.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    AIDefaultConfiguration *configuration = [[AIDefaultConfiguration alloc] init];
    configuration.baseURL = [NSURL URLWithString:@"https://dev.api.ai/api/"];
    
    configuration.clientAccessToken = @"92fa31b4e15c4ffca80dca2942deb6d3";
    [[ApiAI sharedApiAI] setConfiguration:configuration];
    
    return YES;
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply
{
    ApiAI *apiai = [ApiAI sharedApiAI];
    
    AITextRequest *textRequest = (AITextRequest *)[apiai requestWithType:AIRequestTypeText];
    
    textRequest.query = @[userInfo[@"text"]];
    
    [textRequest setCompletionBlockSuccess:^(AIRequest *request, id response) {
        reply(
              @{
                @"response": response,
                }
              );
    } failure:^(AIRequest *request, NSError *error) {
        reply(
              @{
                @"error": error,
                }
        );
    }];
    
    [apiai enqueue:textRequest];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
