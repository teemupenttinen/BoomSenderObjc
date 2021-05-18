//
//  DeviceStorage.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.5.2021.
//

#import "DeviceStorage.h"

@implementation DeviceStorage

-(NSArray<Device *> *)readDevices {
    NSString *savedDevicesJSON = [[NSUserDefaults standardUserDefaults]
        stringForKey:@"preferenceName"];
    
    NSArray<Device *> *devices = 
}

-(void)writeDevices:(NSArray<Device *> *)devices {
    
}

@end
