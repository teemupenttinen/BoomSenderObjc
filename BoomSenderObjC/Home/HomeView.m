//
//  HomeView.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import "HomeView.h"
#import "Masonry.h"
#import "TextFieldWithLabel.h"

@implementation HomeView

-(instancetype)initWithDevices:(NSArray *)devices {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    _devices = devices;
    _collectionView = [[CollectionView alloc] initWithItems:_devices andTitle:@"Devices" andPlaceholder:@"Add your first device!"];

    __weak HomeView *weakSelf = self;

    _collectionView.addCallback = ^{
        weakSelf.addDeviceCallback();
    };

    _collectionView.editCallback = ^(NSInteger idx) {
        weakSelf.editDeviceCallback(idx);
    };

    _collectionView.deleteCallback = ^(NSInteger idx) {
        weakSelf.deleteDeviceCallback(idx);
    };

    
    [self addSubview:_collectionView];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self mas_safeAreaLayoutGuideTop]);
        make.bottom.equalTo([self mas_bottom]);
        make.width.equalTo([self mas_width]);
    }];

//    TextFieldWithLabel *textFieldLabel = [[TextFieldWithLabel alloc] initWithLabel:@"Moi" keyboardType:UIKeyboardTypeDefault];
//    
//    [self addSubview:textFieldLabel];
//    [textFieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo([self mas_safeAreaLayoutGuideTop]);
//        make.width.equalTo([self mas_width]));
//        make.height.equalTo(@100);
//    }];
    
    return self;
}

-(void)updateDevicesWithNewDevices:(NSArray *)newDevices {
    _devices = newDevices;
    [_collectionView reloadData];
}

@end
