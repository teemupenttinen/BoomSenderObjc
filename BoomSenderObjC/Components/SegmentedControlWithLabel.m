//
//  SegmentedControlWithLabel.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import "SegmentedControlWithLabel.h"
#import "Masonry.h"

@implementation SegmentedControlWithLabel

-(instancetype)initWithItems:(NSArray<NSString *> *)items label:(NSString *)label {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    UILabel *textLabel = [UILabel new];
    [textLabel setText:label];
    [textLabel setTextColor:UIColor.whiteColor];
    [textLabel setFont:[UIFont systemFontOfSize:22]];

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
    [segmentedControl setTitleTextAttributes:@{
        NSForegroundColorAttributeName: UIColor.whiteColor
    } forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:@{
        NSForegroundColorAttributeName: UIColor.blackColor
    } forState:UIControlStateSelected];
    
    UIStackView *stackView = [UIStackView new];
    
    [stackView addArrangedSubview:textLabel];
    [stackView addArrangedSubview:segmentedControl];
    [self addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).inset(15);
    }];
    
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.height.equalTo(self).dividedBy(3.5);
    }];
    
    [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textLabel.mas_bottom).offset(10);
        make.height.equalTo(self).dividedBy(1.5);
        make.width.equalTo(self);
    }];
    
    return self;
}

-(void)valueChanged:(UISegmentedControl *)sender {
    if(_valueChangedHandler != nil) {
        _valueChangedHandler(sender);
    }
}

@end
