//
//  ScanQRCodeManager.h
//  CWScanQRCode
//
//  Created by 陆尘风 on 16/4/21.
//  Copyright © 2016年 陆尘风. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResultBlock)(NSString *resultStr);

@interface ScanQRCodeManager : NSObject

+ (instancetype)shareManager;

- (void)setHollowRect:(CGRect)hollowRect PreView:(UIView *)preView;
//开始捕获
- (void)startScanWithResultBlock:(ResultBlock)resultBlock;
//停止捕获
//- (void)stopScan;


@end
