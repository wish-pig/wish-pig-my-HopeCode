//
//  Globaldevicetype.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "Globaldevicetype.h"
#include <sys/types.h>
#include <sys/sysctl.h>
@implementation Globaldevicetype
+ (NSString*)getDeviceVersion
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (NSString *) platformString{
    NSString *platform = [self getDeviceVersion];
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])   return@"iPhone1G";
    if ([platform isEqualToString:@"iPhone1,2"])   return@"iPhone3G";
    if ([platform isEqualToString:@"iPhone2,1"])   return@"iPhone3GS";
    if ([platform isEqualToString:@"iPhone3,1"])   return@"iPhone4";
    if ([platform isEqualToString:@"iPhone3,2"])   return@"VerizoniPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])   return@"iPhone4(CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])   return @"iPhone4s";
    if ([platform isEqualToString:@"iPhone5,1"])   return @"iPhone5(GSM/WCDMA)";
    if ([platform isEqualToString:@"iPhone4,2"])   return @"iPhone5(CDMA)";
    
    //iPot Touch
    if ([platform isEqualToString:@"iPod1,1"])     return@"iPodTouch1G";
    if ([platform isEqualToString:@"iPod2,1"])     return@"iPodTouch2G";
    if ([platform isEqualToString:@"iPod3,1"])     return@"iPodTouch3G";
    if ([platform isEqualToString:@"iPod4,1"])     return@"iPodTouch4G";
    if ([platform isEqualToString:@"iPod5,1"])     return@"iPodTouch5G";
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])     return@"iPad1";
    if ([platform isEqualToString:@"iPad2,1"])     return@"iPad2(WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])     return@"iPad2(GSM)";
    if ([platform isEqualToString:@"iPad2,3"])     return@"iPad2(CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])     return@"iPad2New";
    if ([platform isEqualToString:@"iPad2,5"])     return@"iPadMini(WiFi)";
    if ([platform isEqualToString:@"iPad3,1"])     return@"iPad3(WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])     return@"iPad3(CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])     return@"iPad3(GSM)";
    if ([platform isEqualToString:@"iPad3,4"])     return@"iPad4(WiFi)";
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])        return@"Simulator";
    
    return platform;
}
@end
