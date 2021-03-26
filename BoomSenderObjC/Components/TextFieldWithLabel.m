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
   
    TextField *textField = [[TextField alloc] init];
    
    UIKeyboardType keyboard = keyboardType ? keyboardType : UIKeyboardTypeDefault;
    [textField setKeyboardType:keyboard];
    [textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    [textField setFont:[UIFont systemFontOfSize:22]];
    
    UIStackView *stackView = [[UIStackView alloc]init];
    [stackView addArrangedSubview:textLabel];
    [stackView addArrangedSubview:textField];
    
    [self addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).inset(15);
    }];
    
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self mas_top]);
        make.height.equalTo(self).dividedBy(3.5);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).inset(15);
    }];
    
    return self;
}

-(void)textChanged:(UITextField *)textField {
    if(_textChangedHandler) {
        _textChangedHandler(textField);
    }
}

@end
