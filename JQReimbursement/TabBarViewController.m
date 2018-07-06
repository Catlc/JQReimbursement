//
//  TabBarViewController.m
//  WisdomAnimalHusbandry
//
//  Created by bmxd-005 on 2016/12/7.
//  Copyright © 2016年 bmxd-005. All rights reserved.
//
//#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "TabBarViewController.h"



@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBarChildController];
    self.selectedIndex = 0;
    
}
 - (void)setupTabBarChildController {
    
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    NSArray *imageArray = @[@"新闻与资讯未选中", @"角码供应商未选中", @"企业服务未选中"];
    NSArray *selectImageArray = @[@"新闻与资讯选中", @"角码供应商选中", @"企业服务选中"];
    NSArray *classes = @[@"UIViewController", @"UIViewController", @"UIViewController"];

    NSArray *titleArray = @[@"新闻与资讯", @"能源转型研究院", @"杂志订阅"];
    for (int i = 0; i < imageArray.count; i++) {
        
        Class class = NSClassFromString(classes[i]);
        UIViewController *vc = [class new];
        vc.view.backgroundColor = [UIColor blueColor];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
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
