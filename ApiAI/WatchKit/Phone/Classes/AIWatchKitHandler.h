//
//  AIWatchKitHandler.h
//  WatchKitExample
//
//  Created by Kuragin Dmitriy on 10/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_CLASS_AVAILABLE_IOS(8_2)
@interface AIWatchKitHandler : NSObject

+ (BOOL)handleWatchKitRequest:(NSDictionary *)userInfo andReply:(void(^)(NSDictionary *replyInfo))reply NS_AVAILABLE_IOS(8_2);

@end
