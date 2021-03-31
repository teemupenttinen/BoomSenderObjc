//
//  HomeViewController.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "Masonry.h"
#import "DeviceViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *devices;
@property (nonatomic, readonly) HomeView *homeView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Home"];
    
    _devices = [@[@"Projector 1", @"Projector 2", @"TV 1", @"TV 2", @"Switcher 1", @"Switcher 2", @"Audio Processor 1"] mutableCopy];
    
    _homeView = [[HomeView alloc] initWithDevices:_devices];
    
    [self.view addSubview:_homeView];
    
    [_homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    __weak HomeViewController *weakSelf = self;

    _homeView.deleteDeviceCallback = ^(NSInteger idx) {
        [weakSelf.devices removeObjectAtIndex:idx];
        [weakSelf.homeView updateDevicesWithNewDevices:weakSelf.devices];
    };
    
    _homeView.editDeviceCallback = ^(NSInteger idx) {
        NSLog(@"Edit %ld", (long)idx);
    };
    
    _homeView.addDeviceCallback = ^{
        [weakSelf.navigationController pushViewController:[[DeviceViewController alloc] init] animated:false];
    };
    
}


@end
