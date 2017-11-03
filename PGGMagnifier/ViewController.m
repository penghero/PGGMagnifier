//
//  ViewController.m
//  PGGMagnifier
//
//  Created by 陈鹏 on 2017/11/3.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//使用中有问题 请前去GitHub与我联系 感谢您的使用
//对您有帮助的话 送我一颗星星可好
//GitHub地址 https://github.com/penghero/PGGMagnifier.git
#import "ViewController.h"
#import "PGGMagnigierView.h"

@interface ViewController ()
@property (nonatomic,strong) PGGMagnigierView *magnifyView;//放大镜View
@property (nonatomic,strong) UIImageView *bagVIew;//显示背景
@property (nonatomic,strong) NSTimer *touchTimer;//定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.bagVIew];
}
- (UIImageView *)bagVIew{
    if (_bagVIew == nil) {
        _bagVIew = [[UIImageView alloc] initWithFrame:self.view.frame];
        _bagVIew.userInteractionEnabled = YES;
        _bagVIew.image = [UIImage imageNamed:@"WechatIMG1"];
    }
    return _bagVIew;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touchTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addView) userInfo:nil repeats:NO];
    if (self.magnifyView == nil) {
        self.magnifyView = [[PGGMagnigierView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.magnifyView.magnView = self.view;
    }
        //        返回与当前接收者有关的所有的触摸对象
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint beginPoint = [touch locationInView:self.view];
    self.magnifyView.magnPoint = beginPoint;
        //    自动调用drawRect方法，这样可以拿到  UIGraphicsGetCurrentContext，就可以画画
    [self.magnifyView setNeedsDisplay];
}
- (void)addView{
        //    获取当前主窗口
    [self.magnifyView makeKeyAndVisible];
}

    //让其跟随手指移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *touche = touches;
    UITouch *touch = [touche anyObject];
    self.magnifyView.magnPoint = [touch locationInView:self.view];//主要代码 放大点
    [self.magnifyView setNeedsDisplay];
}

    //移动结束关闭定时器 对象置空
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.touchTimer invalidate];
    self.touchTimer = nil;
    self.magnifyView = nil;
    self.magnifyView.magnView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
