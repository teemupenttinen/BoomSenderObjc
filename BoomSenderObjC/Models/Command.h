//
//  Command.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.5.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Command : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *command;

-(instancetype)initWithName:(NSString *)name command:(NSString *)command;

@end

NS_ASSUME_NONNULL_END
