//
//  RightMenuViewController.m
//  IntelligentSwitchPro
//
//  Created by winter on 14-12-22.
//  Copyright (c) 2014年 Carl. All rights reserved.
//

#import "RightMenuViewController.h"


@interface RightMenuViewController ()
@property (strong, nonatomic)UITableView * tableView;
@end

@implementation RightMenuViewController

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
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(60, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
	self.tableView.backgroundView = imageView;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	 
	if (!cell)
    {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"None";
			break;
			
		case 1:
			cell.textLabel.text = @"Slide";
			break;
			
		case 2:
			cell.textLabel.text = @"Fade";
			break;
			
		case 3:
			cell.textLabel.text = @"Slide And Fade";
			break;
			
		case 4:
			cell.textLabel.text = @"Scale";
			break;
			
		case 5:
			cell.textLabel.text = @"Scale And Fade";
			break;
            
	}
	cell.backgroundColor = [UIColor clearColor];
	return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	id <SlideNavigationContorllerAnimator> revealAnimator;
	
	switch (indexPath.row)
	{
		case 0:
			revealAnimator = nil;
			break;
			
		case 1:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlide alloc] init];
			break;
			
		case 2:
			revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
			break;
			
		case 3:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlideAndFade alloc] initWithMaximumFadeAlpha:.8 fadeColor:[UIColor blackColor] andSlideMovement:100];
			break;
			
		case 4:
			revealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
			break;
			
		case 5:
			revealAnimator = [[SlideNavigationContorllerAnimatorScaleAndFade alloc] initWithMaximumFadeAlpha:.6 fadeColor:[UIColor blackColor] andMinimumScale:.8];
			break;
			
		default:
			return;
	}
	
//	[[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
//		[SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
//	}];
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
