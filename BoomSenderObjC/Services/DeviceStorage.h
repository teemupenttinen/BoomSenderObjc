//
//  DeviceStorage.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.5.2021.
//

#import <Foundation/Foundation.h>
#import "Device.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeviceStorage : NSObject

-(NSArray<Device *> *)readDevices;
-(void)writeDevices:(NSArray<Device *> *)devices;

@end

NS_ASSUME_NONNULL_END
