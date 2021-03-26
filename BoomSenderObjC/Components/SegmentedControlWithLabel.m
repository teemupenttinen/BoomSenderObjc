//
//  SegmentedControlWithLabel.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import "SegmentedControlWithLabel.h"

@implementation SegmentedControlWithLabel

-(instancetype)initWithItems:(NSArray<NSString *> *)items label:(NSString *)label {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    UILabel *textLabel = [UILabel new];
    [textLabel setText:label];
    [textLabel setTextColor:UIColor.whiteColor];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    
    return self;
}

//    let segmentedControl = UISegmentedControl(items: items)
//    segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
//    segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//    segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
//    let stackView = UIStackView()
//
//    stackView.addSubview(textLabel)
//    stackView.addSubview(segmentedControl)
//    addSubview(stackView)
//
//
//    textLabel.font = textLabel.font.withSize(22)
//
//    stackView.snp.makeConstraints { (make) in
//        make.edges.equalToSuperview().inset(15)
//    }
//
//    textLabel.snp.makeConstraints { (make) in
//        make.top.equalToSuperview()
//        make.height.equalToSuperview().dividedBy(3.5)
//    }
//
//    segmentedControl.snp.makeConstraints { (make) in
//        make.top.equalTo(textLabel.snp.bottom).offset(10)
//        make.height.equalToSuperview().dividedBy(1.5)
//        make.width.equalToSuperview()
//    }
//
//}
//
//@objc func valueChanged(_ sender: UISegmentedControl) {
//
//}


@end
