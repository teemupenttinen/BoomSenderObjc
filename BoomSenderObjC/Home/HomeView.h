//
//  HomeView.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import <UIKit/UIKit.h>
#import "CollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView

typedef void(^CallbackWithIndex)(NSInteger idx);

@property (nonatomic, strong) NSArray *devices;
@property (nonatomic, strong) CollectionView *collectionView;

@property (nullable) CallbackWithIndex deleteDeviceCallback;
@property (nullable) CallbackWithIndex editDeviceCallback;
@property (nullable) void(^addDeviceCallback)(void);

-(instancetype)initWithDevices:(NSArray *)devices;
-(void)updateDevicesWithNewDevices:(NSArray *)newDevices;

@end

NS_ASSUME_NONNULL_END
