# ZYPCaptchaView
随机验证码


## 可定制内容

* 干扰线数量与宽度
* 验证码个数与字体

## 例图

![image](./image.png)


## 使用

导入头文件`ZYPCaptchaView.h`后添加在视图上即可

```objective-c
ZYPCaptchaView * captchaView = [[ZYPCaptchaView alloc]initWithFrame:CGRectMake(100, 100, 120, 40)];
[self.view addSubview:captchaView];
```
