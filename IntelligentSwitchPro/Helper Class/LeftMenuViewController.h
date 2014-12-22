//
//  LeftMenuViewController.h
//  IntelligentSwitchPro
//
//  Created by winter on 14-12-22.
//  Copyright (c) 2014年 Carl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@interface LeftMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
