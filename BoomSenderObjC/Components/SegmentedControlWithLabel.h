//
//  SegmentedControlWithLabel.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegmentedControlWithLabel : UIView

-(instancetype)initWithItems:(NSArray<NSString *> *)items label:(NSString *)label;

@end

NS_ASSUME_NONNULL_END
