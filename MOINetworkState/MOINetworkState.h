//
//  MOINetworkState.h
//  MOINetworkStateDemo
//
//  Created by mconintet on 10/29/15.
//  Copyright © 2015 mconintet. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreTelephony;

typedef NS_ENUM(NSUInteger, MOINetworkStateCode) {
    MOINetworkStateCodeNone = 0,
    MOINetworkStateCodeWiFi = 1,
    MOINetworkStateCode4G = 2,
    MOINetworkStateCode3G = 3,
    MOINetworkStateCode2G = 4
};

NSString* MOINetworkStateText(NSInteger code);

typedef void (^MOINetworkStateDidChangeHandler)(MOINetworkStateCode);

@interface MOINetworkState : NSObject

- (instancetype)initWithDidChangeHandler:(MOINetworkStateDidChangeHandler)handler;

+ (MOINetworkStateCode)currentState;

@end
