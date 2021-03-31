//
//  DeviceView.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 26.3.2021.
//

#import "Masonry.h"
#import "DeviceView.h"
#import "TextFieldWithLabel.h"
#import "SegmentedControlWithLabel.h"
#import "CollectionView.h"
#import "BasicButton.h"

@implementation DeviceView

-(instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    TextFieldWithLabel *nameField = [TextFieldWithLabel new];

    [nameField setTextChangedHandler:^(UITextField * _Nonnull sender) {
        [self setName:sender.text];
    }];
    
    SegmentedControlWithLabel *controlMethodSelector = [[SegmentedControlWithLabel alloc]
                                                        initWithItems:@[@"TCP",@"UDP"] label:@"Control method"];
    
    TextFieldWithLabel *portField = [[TextFieldWithLabel alloc] initWithLabel:@"Port" keyboardType:UIKeyboardTypeDecimalPad];
    [portField setTextChangedHandler:^(UITextField * _Nonnull sender) {
        
        // Validate port
        [self setPort:[sender.text integerValue]];
    }];
    
    CollectionView *collectionView = [[CollectionView alloc] initWithItems:@[@"Dog", @"Cat", @"Horse"] andTitle:@"Commands"];
    [collectionView setAddCallback:^{
        self.addCommandCallback();
    }];
    
    BasicButton *saveButton = [[BasicButton alloc] initWithContent:@"Save"];
    
    [saveButton addTarget:self action:@selector(saveButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:nameField];
    [self addSubview:controlMethodSelector];
    [self addSubview:portField];
    [self addSubview:collectionView];
    [self addSubview:saveButton];
    
    [nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@100);
        make.width.equalTo([self mas_width]);
        make.top.equalTo([self mas_safeAreaLayoutGuideTop]);
        make.left.equalTo([self mas_safeAreaLayoutGuideLeft]);
    }];
    
//    [controlMethodSelector mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@100);
//        make.width.equalTo(self);
//        make.left.right.equalTo([self mas_safeAreaLayoutGuide]);
//        make.top.equalTo([nameField mas_bottom]).offset(20);
//    }];
//    
//    [portField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@100);
//        make.width.equalTo([self mas_width]);
//        make.left.right.equalTo([self mas_safeAreaLayoutGuide]);
//        make.top.equalTo([controlMethodSelector mas_bottom]).offset(20);
//    }];
//    
//    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo([self mas_bottom]).offset(20);
//        make.width.equalTo([self mas_width]);
//        make.height.equalTo(@300);
//    }];
//    
//    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@60);
//        make.left.equalTo(self).offset(20);
//        make.right.equalTo(self).inset(20);
//        make.bottom.equalTo(self).inset(50);
//    }];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
    
    return self;
}

-(void)handleGesture:(DeviceView *)view {
    [view endEditing:false];
}

-(void)saveButtonHandler:(UIButton *)sender {
    
}


//addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleGesture)))


@end
