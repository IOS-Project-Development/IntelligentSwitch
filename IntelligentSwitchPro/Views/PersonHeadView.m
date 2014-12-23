//
//  PersonHeadView.m
//  IntelligentSwitchPro
//
//  Created by carl on 14-12-22.
//  Copyright (c) 2014年 Carl. All rights reserved.
//

#import "PersonHeadView.h"

@implementation PersonHeadView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


+(PersonHeadView *)instanceTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"PersonHeadView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}
@end
