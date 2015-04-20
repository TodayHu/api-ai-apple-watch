//
//  AIWatchKitRequest.h
//  WatchKitExample
//
//  Created by Kuragin Dmitriy on 10/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AIWatchKitRequestSuccesfull)(id response);
typedef void(^AIWatchKitRequestFailur)(NSError *respose);

NS_CLASS_AVAILABLE_IOS(8_2)
@interface AIWatchKitRequest : NSObject

@property(nonatomic, copy) AIWatchKitRequestSuccesfull succesfull NS_AVAILABLE_IOS(8_2);
- (void)setSuccesfull:(AIWatchKitRequestSuccesfull)succesfull NS_AVAILABLE_IOS(8_2);

@property(nonatomic, copy) AIWatchKitRequestFailur failure NS_AVAILABLE_IOS(8_2);
- (void)setFailure:(AIWatchKitRequestFailur)failure NS_AVAILABLE_IOS(8_2);

- (void)setCompletionWithSuccesfull:(AIWatchKitRequestSuccesfull)succesfull
                         andFailure:(AIWatchKitRequestFailur)failure NS_AVAILABLE_IOS(8_2);

- (void)runWithCompletionWithSuccesfull:(AIWatchKitRequestSuccesfull)succesfull
                             andFailure:(AIWatchKitRequestFailur)failure NS_AVAILABLE_IOS(8_2);

- (void)run NS_AVAILABLE_IOS(8_2);

- (NSDictionary *)userInfoForRequest NS_AVAILABLE_IOS(8_2);

@end
