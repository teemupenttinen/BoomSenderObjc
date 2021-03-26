//
//  ViewController.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, readonly) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_button setTitle:@"Moi" forState:UIControlStateNormal];
    [_button setBackgroundColor:UIColor.redColor];
    
    _button = [[UIButton alloc]init];
    [_button setTitle:@"Koira" forState:UIControlStateNormal];
    [_button.titleLabel setFont:[UIFont systemFontOfSize: 15]];
    [_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_button.layer setBorderWidth:2];
    [_button.layer setBorderColor:[UIColor systemBlueColor].CGColor];
    [_button.layer setCornerRadius:10];
    //[_button addTarget:self action:@selector(callDog) forControlEvents:UIControlEventTouchUpInside];
    [_button addAction:[UIAction actionWithHandler:^(UIAction *action){
        NSLog(@"Never gets here");
    }] forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.width.equalTo(@150);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).inset(15);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}


@end
