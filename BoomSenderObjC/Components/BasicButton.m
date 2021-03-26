//
//  BasicButton.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import "BasicButton.h"

@implementation BasicButton

-(instancetype)initWithContent:(NSString *)content {
    
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    [self setBackgroundColor:[UIColor colorWithRed:184/255 green:139/255 blue:74/255 alpha:0.9]];
    [self.layer setCornerRadius:10];
    [self setTitle:content forState:UIControlStateNormal];
    
    return self;
}

@end
