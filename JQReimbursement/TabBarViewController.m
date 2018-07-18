//
//  TabBarViewController.m
//  WisdomAnimalHusbandry
//
//  Created by bmxd-005 on 2016/12/7.
//  Copyright © 2016年 bmxd-005. All rights reserved.
//
//#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "TabBarViewController.h"
#import "JQBaseNavViewController.h"

#import "JQMineViewController.h"
#import "JQHomeViewController.h"
#import "JQMessageViewController.h"
#import "JQFunctionViewController.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBarChildController];
    self.selectedIndex = 0;
    [self.tabBar.items objectAtIndex:2].badgeValue = @"99";
    [self.tabBar.items objectAtIndex:2].badgeColor = [UIColor redColor];
}
 - (void)setupTabBarChildController {
    
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    NSArray *imageArray = @[@"tab_icon_nor_bg", @"tab_icon_nor_gn", @"tab_icon_nor_xx",@"tab_icon_nor_wo"];
    NSArray *selectImageArray = @[@"tab_icon_sel_bg", @"tab_icon_sel_gn", @"tab_icon_sel_xx",@"tab_icon_sel_wo"];
    NSArray *classes = @[@"JQHomeViewController", @"JQFunctionViewController", @"JQMessageViewController",@"JQMineViewController"];

    NSArray *titleArray = @[@"首页", @"功能", @"消息",@"我的"];
    for (int i = 0; i < imageArray.count; i++) {
        
        Class class = NSClassFromString(classes[i]);
        UIViewController *vc = [class new];
        vc.view.backgroundColor = [UIColor whiteColor];
        JQBaseNavViewController *nav = [[JQBaseNavViewController alloc]initWithRootViewController:vc];
        vc.title = titleArray[i];
        
        nav.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self unSelectedTapTabBarItems:nav.tabBarItem];
        [self selectedTapTabBarItems:nav.tabBarItem];
        
        [self addChildViewController:nav];
    }
}


-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:13], NSFontAttributeName, [UIColor grayColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:13],
                                        NSFontAttributeName, [UIColor colorWithRed:0.20 green:0.55 blue:0.85 alpha:1.00],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
