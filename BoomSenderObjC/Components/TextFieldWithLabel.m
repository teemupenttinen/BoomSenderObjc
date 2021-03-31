//
//  TextFieldWithLabel.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import "TextFieldWithLabel.h"
#import "TextField.h"
#import "Masonry.h"

@interface TextFieldWithLabel()

@end

@implementation TextFieldWithLabel

-(instancetype)initWithLabel:(NSString *)label keyboardType:(UIKeyboardType)keyboardType {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    UILabel *textLabel = [[UILabel alloc] init];
    [textLabel setText:label];
    [textLabel setTextColor:UIColor.whiteColor];
   
    UIKeyboardType keyboard = keyboardType ? keyboardType : UIKeyboardTypeDefault;
    TextField *textField = [[TextField alloc] initWithKeyboardType:keyboard];
    [textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    [textField setFont:[UIFont systemFontOfSize:22]];
    
    UIStackView *stackView = [[UIStackView alloc]init];
    [stackView setAxis:UILayoutConstraintAxisVertical];
    [stackView addArrangedSubview:textLabel];
    [stackView addArrangedSubview:textField];
    
    [self addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([self mas_height]);
        make.edges.equalTo(self);
    }];

    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
    }];
    
    return self;
}

-(void)textChanged:(UITextField *)textField {
    if(_textChangedHandler) {
        _textChangedHandler(textField);
    }
}

@end
