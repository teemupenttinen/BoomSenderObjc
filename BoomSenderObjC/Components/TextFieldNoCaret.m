//
//  TextFieldNoCaret.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 24.3.2021.
//

#import "TextFieldNoCaret.h"

@implementation TextFieldNoCaret

-(instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    [self setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:0.9]];
    [self.layer setCornerRadius:10];
    
    return self;
}

-(CGRect)caretRectForPosition:(UITextPosition *)position {
    return CGRectZero;
}

-(CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 5, 5);
}

-(CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 5, 5);
}

-(CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 5, 5);
}

@end
