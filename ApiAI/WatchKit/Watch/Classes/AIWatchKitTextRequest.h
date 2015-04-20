//
//  AIWatchKitTextRequest.h
//  WatchKitExample
//
//  Created by Kuragin Dmitriy on 10/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import "AIWatchKitRequest.h"

NS_CLASS_AVAILABLE_IOS(8_2)
@interface AIWatchKitTextRequest : AIWatchKitRequest

@property(nonatomic, copy) id query NS_AVAILABLE_IOS(8_2);

@end
