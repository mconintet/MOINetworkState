//
//  MOINetworkState.m
//  MOINetworkStateDemo
//
//  Created by mconintet on 10/29/15.
//  Copyright © 2015 mconintet. All rights reserved.
//

#import "MOINetworkState.h"
#import "Reachability.h"

NSString* MOINetworkStateText(NSInteger code)
{
    switch (code) {
    case MOINetworkStateCodeNone:
        return @"None";
        break;
    case MOINetworkStateCodeWiFi:
        return @"Wifi";
        break;
    case MOINetworkStateCode4G:
        return @"4G";
        break;
    case MOINetworkStateCode3G:
        return @"3G";
        break;
    case MOINetworkStateCode2G:
        return @"2G";
        break;
    default:
        break;
    }
    return @"";
}

@interface MOINetworkState ()
@property (nonatomic, strong) Reachability* internetReachability;
@property (nonatomic, strong) MOINetworkStateDidChangeHandler didChangeHandler;
@end

@implementation MOINetworkState

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]
        removeObserver:self
                  name:kReachabilityChangedNotification
                object:nil];
}

- (instancetype)initWithDidChangeHandler:(MOINetworkStateDidChangeHandler)handler
{
    self = [super init];
    if (self) {
        _didChangeHandler = handler;

        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(reachabilityChanged:)
                   name:kReachabilityChangedNotification
                 object:nil];

        _internetReachability = [Reachability reachabilityForInternetConnection];
        [_internetReachability startNotifier];
    }
    return self;
}

- (void)reachabilityChanged:(NSNotification*)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    if (_didChangeHandler != nil) {
        _didChangeHandler([[self class] currentState]);
    }
}

+ (MOINetworkStateCode)currentState
{
    Reachability* reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
    case NotReachable:
        return MOINetworkStateCodeNone;
        break;
    case ReachableViaWiFi:
        return MOINetworkStateCodeWiFi;
    case ReachableViaWWAN: {
        CTTelephonyNetworkInfo* info = [CTTelephonyNetworkInfo new];
        NSString* state = info.currentRadioAccessTechnology;

        if (state == CTRadioAccessTechnologyGPRS || state == CTRadioAccessTechnologyEdge) {
            return MOINetworkStateCode2G;
        }

        if (state == CTRadioAccessTechnologyLTE) {
            return MOINetworkStateCode4G;
        }

        return MOINetworkStateCode3G;
    }
    default:
        break;
    }
}

@end
