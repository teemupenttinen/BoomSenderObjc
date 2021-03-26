//
//  TextFieldWithLabel.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldWithLabel : UIView

@property (nullable) void(^textChangedHandler)(UITextField *sender);

-(instancetype)initWithLabel:(NSString *)label keyboardType:(UIKeyboardType)keyboardType;

@end

NS_ASSUME_NONNULL_END
