//
//  DeviceItemCell.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 21.3.2021.
//

#import "DeviceItemCell.h"
#import "Masonry.h"

@implementation DeviceItemCell

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    _title = [UILabel new];
    
    [self setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:0.9]];
    [_title setTextColor:UIColor.blackColor];
    [self.contentView addSubview:_title];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60).priority(999);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.centerY.equalTo([self mas_centerY]);
        make.left.equalTo([self mas_left]).offset(15);
    }];
    
    return self;
}

@end
