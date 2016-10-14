//
//  ZYPCaptchaView.h
//  ZYPCaptchaView
//
//  Created by zhaoyunpeng on 16/10/14.
//  Copyright © 2016年 zhaoyunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPCaptchaView : UIView

// 字符素材数组
@property (strong, nonatomic) NSArray * dataArray;
// 验证码字符串
@property (strong, nonatomic) NSMutableString * captchaStr;

@end
