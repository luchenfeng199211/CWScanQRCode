//
//  ScanQRCodeManager.m
//  CWScanQRCode
//
//  Created by 陆尘风 on 16/4/21.
//  Copyright © 2016年 陆尘风. All rights reserved.
//

#import "ScanQRCodeManager.h"
#import <AVFoundation/AVFoundation.h>

@interface ScanQRCodeManager () <AVCaptureMetadataOutputObjectsDelegate>
{
    CGRect                      _hollowRect;
    UIView                      *_preView;
    AVCaptureSession            *_session;
    ResultBlock                 _resultBlock;
}
@end

@implementation ScanQRCodeManager

+ (instancetype)shareManager
{
    static ScanQRCodeManager *_manager;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        _manager = [[ScanQRCodeManager alloc] init];
    });
    return _manager;
}

- (void)setHollowRect:(CGRect)hollowRect PreView:(UIView *)preView
{
    _hollowRect = hollowRect;
    _preView = preView;
}

- (void)startScanWithResultBlock:(void (^)(NSString *))resultBlock
{
    _resultBlock = resultBlock;
    //获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输出流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setRectOfInterest:CGRectMake(_hollowRect.origin.y/SCREEN_SIZE.height, _hollowRect.origin.x/SCREEN_SIZE.width, _hollowRect.size.height/SCREEN_SIZE.height, _hollowRect.size.width/SCREEN_SIZE.width)];
    //初始化连接对象
    _session = [[AVCaptureSession alloc] init];
    //高质量采集
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    [_session addInput:input];
    [_session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,         //二维码
                                   AVMetadataObjectTypeEAN13Code,      //条形码
                                   AVMetadataObjectTypeEAN8Code,       //条形码
                                   AVMetadataObjectTypeCode128Code     //条形码
                                   ];
    AVCaptureVideoPreviewLayer *preViewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    preViewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    preViewLayer.frame = CGRectMake(0, 0, _preView.bounds.size.width, _preView.bounds.size.height);
    [_preView.layer addSublayer:preViewLayer];
    //开始捕获
    if (![_session isRunning]) {
        [_session startRunning];
    }
}

//- (void)stopScan
//{
//    [_session stopRunning];
//}

#pragma mark - AVCaptureMetadataOutputObjects Delegate - 扫描回调
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count>0) {
        if ([_session isRunning]) {
            [_session stopRunning];
        }
        AVMetadataMachineReadableCodeObject *object = [metadataObjects objectAtIndex:0];
        _resultBlock(object.stringValue);
    }
    
}

@end
