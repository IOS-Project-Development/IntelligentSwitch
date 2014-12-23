//
//  PersonHeadView.h
//  IntelligentSwitchPro
//
//  Created by carl on 14-12-22.
//  Copyright (c) 2014年 Carl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonHeadView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
-(id)initWithFrame:(CGRect)frame;
+(PersonHeadView *)instanceTextView ;
@end
