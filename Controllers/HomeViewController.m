//
//  HomeViewController.m
//  CWScanQRCode
//
//  Created by 陆尘风 on 16/4/21.
//  Copyright © 2016年 陆尘风. All rights reserved.
//

#import "HomeViewController.h"

#import "ScanQRCodeViewController.h"

@interface HomeViewController ()
{
    UIButton *_button;
}
@end

@implementation HomeViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self loadSubView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    
}

- (void)loadSubView
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _button.frame = CGRectMake(0, 0, 100, 30);
    _button.center = self.view.center;
    [self.view addSubview:_button];
}

- (void)btnClick
{
    ScanQRCodeViewController *scanQRCodeVC = [[ScanQRCodeViewController alloc] init];
    [self.navigationController pushViewController:scanQRCodeVC animated:YES];
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
