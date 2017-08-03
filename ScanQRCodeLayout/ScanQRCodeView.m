//
//  ScanQRCodeView.m
//  CWScanQRCode
//
//  Created by 陆尘风 on 16/4/21.
//  Copyright © 2016年 陆尘风. All rights reserved.
//

#import "ScanQRCodeView.h"

@interface ScanQRCodeView ()
{
    UIView                      *_scanView;
}
@end

@implementation ScanQRCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self loadSubView];
        self.backgroundColor = [UIColor clearColor];
        self.opaque =NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Start by filling the area with the blue color
    
    [[UIColor colorWithWhite:0.0f alpha:0.5f] setFill];//阴影效果 根据透明度来设计
    
    UIRectFill( rect );
    
    CGFloat oneDeviceW = SCREEN_SIZE.width - 100;
    CGFloat oneDeviceH = oneDeviceW;//oneDeviceW*0.3;
    CGFloat oneDeviceX = SCREEN_SIZE.width/2.0 - oneDeviceW/2.0;
    CGFloat oneDeviceY = 0;
    if (self.bounds.size.height < SCREEN_SIZE.height) {
        oneDeviceY = SCREEN_SIZE.height/2.0 - oneDeviceH/2.0 - 64;
    }else{
        oneDeviceY = SCREEN_SIZE.height/2.0 - oneDeviceH/2.0;
    }
    CGRect hollowRect = CGRectMake(oneDeviceX, oneDeviceY, oneDeviceW, oneDeviceH);
    CGRect holeRectIntersection = CGRectIntersection( hollowRect, rect );
    
    [[UIColor clearColor] setFill];
    
    UIRectFill( holeRectIntersection );
    
}

//- (void)loadSubView
//{
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
//    bgView.backgroundColor = [UIColor lightGrayColor];
//    bgView.alpha = 0.8;
//    [self addSubview:bgView];
//    
//    float width = bgView.bounds.size.width - 100;
//    float height = width;
//    if (self.bounds.size.height < SCREEN_HEIGHT) {
//        _scanView = [[UIView alloc] initWithFrame:CGRectMake(bgView.bounds.size.width/2.0 - width/2.0, SCREEN_HEIGHT/2.0 - height/2.0 - 64, width, height)];
//    }else{
//        _scanView = [[UIView alloc] initWithFrame:CGRectMake(bgView.bounds.size.width/2.0 - width/2.0, SCREEN_HEIGHT/2.0 - height/2.0 - 64, width, height)];
//    }
//    _scanView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:_scanView];
//}

//- (void)startScan
//{
//    //获取摄像设备
//    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    //创建输出流
//    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
//    //创建输出流
//    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
//    //设置代理 在主线程里刷新
//    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
//    [output setRectOfInterest:CGRectMake(_scanView.bounds.origin.y/SCREEN_HEIGHT, _scanView.bounds.origin.x/SCREEN_WIDTH, _scanView.bounds.size.height/SCREEN_HEIGHT, _scanView.bounds.size.width/SCREEN_WIDTH)];
//    //初始化连接对象
//    _session = [[AVCaptureSession alloc] init];
//    //高质量采集
//    [_session setSessionPreset:AVCaptureSessionPresetHigh];
//    [_session addInput:input];
//    [_session addOutput:output];
//    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
//    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,         //二维码
//                                    AVMetadataObjectTypeEAN13Code,      //条形码
//                                    AVMetadataObjectTypeEAN8Code,       //条形码
//                                    AVMetadataObjectTypeCode128Code     //条形码
//                                    ];
//    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
//    preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    preview.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
////    [self.layer insertSublayer:preview above:0];
//    [self.layer addSublayer:preview];
//    //开始捕获
//    [_session startRunning];
//}
//
//- (void)stopScan
//{
//    [_session stopRunning];
//}
//
//#pragma mark - AVCaptureMetadataOutputObjects Delegate - 扫描回调
//- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
//{
//    AVMetadataMachineReadableCodeObject *object = [metadataObjects objectAtIndex:0];
//    NSLog(@"%@",object.stringValue);
//}

@end
