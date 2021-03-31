//
//  DeviceView.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 26.3.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceView : UIView

typedef void(^CallbackWithIndex)(NSInteger idx);

@property (nullable) void(^addCommandCallback)(void);

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger *port;


@end

NS_ASSUME_NONNULL_END
