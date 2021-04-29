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
    [textLabel setFont:[UIFont systemFontOfSize:22]];
   
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
        make.edges.equalTo(stackView.superview).inset(15);
    }];

    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textLabel.superview.mas_top);
        make.height.equalTo(textLabel.superview.mas_height).dividedBy(3.5);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textLabel.mas_bottom).offset(10);
        make.height.equalTo(textField.superview.mas_height).dividedBy(1.5);
        make.width.equalTo(textField.superview.mas_width);
    }];
    
    return self;
}

-(void)textChanged:(UITextField *)textField {
    if(_textChangedHandler) {
        _textChangedHandler(textField);
    }
}

@end
