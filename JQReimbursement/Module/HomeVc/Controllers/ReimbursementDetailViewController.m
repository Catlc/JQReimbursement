//
//  ReimbursementDetailViewController.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/15.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "ReimbursementDetailViewController.h"

@interface ReimbursementDetailViewController ()

@end

@implementation ReimbursementDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.navigationItem.title = @"可选明细";
    
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClick)];
    self.navigationItem.rightBarButtonItem = barButton;
}
- (void)addClick{
    NSLog(@"新增明细");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
