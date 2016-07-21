//
//  MCSecondPageViewController.h
//  LeftSlide
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCSecondPageViewController.h"
#import "DKNightVersion.h"
#import "MCLeftSliderManager.h"
@implementation MCSecondPageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    navigationLabel.text = @"设置";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = [UIColor yellowColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        navigationLabel.nightTextColor = [UIColor whiteColor];
        self.navigationController.navigationBar.nightBarTintColor = [UIColor blackColor];

    }];
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];

}
- (void) openOrCloseLeftList
{
    
    if ([MCLeftSliderManager sharedInstance].LeftSlideVC.closed)
    {
        [[MCLeftSliderManager sharedInstance].LeftSlideVC openLeftView];
    }
    else
    {
        [[MCLeftSliderManager sharedInstance].LeftSlideVC closeLeftView];
    }
}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:NO];
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:YES];
//}

@end
