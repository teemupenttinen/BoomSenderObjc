//
//  DeviceViewController.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 26.3.2021.
//

#import "Masonry.h"
#import "DeviceViewController.h"
#import "DeviceView.h"

@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Device"];
    
    DeviceView *deviceView = [[DeviceView alloc] init];
    
    [self.view addSubview:deviceView];
    
    [deviceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [deviceView setAddCommandCallback:^{
        NSLog(@"Add command");
    }];

//    deviceView.addCommandCallback = { [weak self] in
//        self?.navigationController?.pushViewController(CommandViewController(), animated: false)
//    }
}

@end
