//
//  ViewController.m
//  ZYPCaptchaView
//
//  Created by zhaoyunpeng on 16/10/14.
//  Copyright © 2016年 zhaoyunpeng. All rights reserved.
//

#import "ViewController.h"
#import "ZYPCaptchaView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZYPCaptchaView * captchaView = [[ZYPCaptchaView alloc]initWithFrame:CGRectMake(100, 100, 120, 40)];
    [self.view addSubview:captchaView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
