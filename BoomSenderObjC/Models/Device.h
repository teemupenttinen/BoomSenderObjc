//
//  Device.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.5.2021.
//

#import <Foundation/Foundation.h>
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    TCP,
    UDP
} CONTROL_METHOD;

@interface Device : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) CONTROL_METHOD controlMethod;
@property (nonatomic) NSInteger port;
@property (nonatomic, strong) NSArray<Command *> *commands;

-(instancetype)initWithName:(NSString *)name controlMethod:(CONTROL_METHOD)controlMethod port:(NSInteger)port;
-(void)addCommandWithName:(NSString *)name command:(NSString *)command;

@end

NS_ASSUME_NONNULL_END
