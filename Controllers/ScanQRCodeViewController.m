//
//  ScanQRCodeViewController.m
//  CWScanQRCode
//
//  Created by 陆尘风 on 16/4/21.
//  Copyright © 2016年 陆尘风. All rights reserved.
//

#import "ScanQRCodeViewController.h"

#import "ScanQRCodeManager.h"
#import "ScanQRCodeView.h"

@interface ScanQRCodeViewController ()
{
    ScanQRCodeView *_scanQRCodeView;
}
@end

@implementation ScanQRCodeViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor blackColor];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE.width, SCREEN_SIZE.height - 64)];
    [self.view addSubview:bgView];
    
    CGFloat oneDeviceW = SCREEN_SIZE.width - 100;
    CGFloat oneDeviceH = oneDeviceW;//oneDeviceW*0.3;
    CGFloat oneDeciceX = 40;
    CGFloat oneDeciceY = 0;
    if (self.view.bounds.size.height < SCREEN_SIZE.height) {
        oneDeciceY = SCREEN_SIZE.height/2.0 - oneDeviceH/2.0 - 64;
    }else{
        oneDeciceY = SCREEN_SIZE.height/2.0 - oneDeviceH/2.0;
    }
    CGRect hollowRect = CGRectMake(oneDeciceX, oneDeciceY, oneDeviceW, oneDeviceH);
    [[ScanQRCodeManager shareManager] setHollowRect:hollowRect PreView:bgView];
    [[ScanQRCodeManager shareManager] startScanWithResultBlock:^(NSString *resultStr) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"%@",resultStr] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }];
    
    _scanQRCodeView = [[ScanQRCodeView alloc] initWithFrame:CGRectMake(0, 0, bgView.bounds.size.width, bgView.bounds.size.height)];
    [bgView addSubview:_scanQRCodeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
