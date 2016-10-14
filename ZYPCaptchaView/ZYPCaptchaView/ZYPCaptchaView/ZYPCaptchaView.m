//
//  ZYPCaptchaView.m
//  ZYPCaptchaView
//
//  Created by zhaoyunpeng on 16/10/14.
//  Copyright © 2016年 zhaoyunpeng. All rights reserved.
//

// 随机颜色
#define kRandomColor [UIColor colorWithRed:arc4random()% 256 / 256.0 green:arc4random()% 256 / 256.0 blue:arc4random()% 256 / 256.0 alpha:1.0]

// 干扰线个数
#define kLineCount 6

// 干扰线的宽度
#define kLineWidth 1.0

// 需要验证码的个数
#define kCharCount 4

// 字体大小
#define kFontSize [UIFont systemFontOfSize:arc4random()%5+16]


#import "ZYPCaptchaView.h"

@implementation ZYPCaptchaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self getCaptcha];
    }
    return self;
}

#pragma mark - 获取验证码

- (void)getCaptcha
{
    // 字符串素材
    _dataArray = [[NSArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    
    // 验证字符串
    _captchaStr = [[NSMutableString alloc]initWithCapacity:kCharCount];
    
    // 随机从数组中选取需要个数的字符串，拼接为验证字符串
    for (int i=0; i < kCharCount; i++)
    {
        NSInteger index = arc4random()%_dataArray.count;
        NSString * tempStr = [_dataArray objectAtIndex:index];
        _captchaStr = (NSMutableString*)[_captchaStr stringByAppendingString:tempStr];
    }
}


#pragma mark - 点击界面切换验证码

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getCaptcha];
    
    // setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

// setNeedsDisplay自动调用drawRect
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.backgroundColor = kRandomColor;
    
    // 计算每个字符显示的位置
    NSString * text = [NSString stringWithFormat:@"%@",_captchaStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    
    
    // 依次绘制每一个字符，可以设置显示的每个字符的字体大小、颜色、样式等
    CGPoint point;
    float pX,pY;
    
    for (int i=0; i < text.length; i++)
    {
        pX = arc4random()%width+rect.size.width/text.length*i;
        pY = arc4random()%height;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString * textC = [NSString stringWithFormat:@"%C",c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    
    // 调用drawRect之前，系统会向栈中压入一个CGContextRef,调用UIGraphicsGetCurrentContext()获取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线条宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    // 绘制干扰线
    for (int i = 0; i < kLineCount; i++)
    {
        UIColor* color = kRandomColor;
        
        //设置线条填充色
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        
        //设置线的起点
        pX = arc4random()%(int)rect.size.width;
        pY = arc4random()%(int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        
        //设置终点
        pX = arc4random()%(int)rect.size.width;
        pY = arc4random()%(int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        
        //画线
        CGContextStrokePath(context);
    }
}


@end
