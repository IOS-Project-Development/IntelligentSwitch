//
//  LeftMenuViewController.m
//  IntelligentSwitchPro
//
//  Created by winter on 14-12-22.
//  Copyright (c) 2014年 Carl. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "PersonHeadView.h"
#import "LoginViewController.h"
#import "ControlViewController.h"
#import "AboutViewController.h"
#import "ClockViewController.h"
#import "ExpandViewController.h"
#import "SceneViewController.h"
#import "SettingViewController.h"
@interface LeftMenuViewController ()
{
    
}
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation LeftMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI
{
    self.view.layer.borderWidth = .6;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
//	self.tableView.backgroundView = imageView;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor grayColor];
    
    //个人头像和名字
    PersonHeadView *person = [PersonHeadView instanceTextView];
    person.frame = CGRectMake (20, 30, 320, 50);
    person.backgroundColor = [UIColor grayColor];
    person.nameLabel.text = @"Myname";
    person.headerImage.image = [UIImage imageNamed:@"我的金象-头像.png"];
    self.tableView.tableHeaderView = person;
}
#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIndentifier = @"Cell";
	UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"Login";
			break;
			
		case 1:
			cell.textLabel.text = @"Control";
			break;
			
		case 2:
			cell.textLabel.text = @"Scene";
			break;
			
		case 3:
			cell.textLabel.text = @"Expand";
			break;
        case 4:
            cell.textLabel.text = @"Clock";
            break;
        case 5:
            cell.textLabel.text = @"Setting";
            break;
        case 6:
            cell.textLabel.text = @"About";
            break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
            vc = [[LoginViewController alloc]init];
			break;
			
		case 1:
            vc = [[ControlViewController alloc]init];
			break;
			
		case 2:
            break;
			
		case 3:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
