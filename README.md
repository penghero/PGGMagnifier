# PGGMagnifier
GitHub地址 https://github.com/penghero/PGGMagnifier.git
鹏哥哥放大镜 封装好 线程安全 无泄漏 简单易用 移植性好
使用中有问题 请前去GitHub与我联系 感谢您的使用
对您有帮助的话 送我一颗星星可好 
使用简介：
1.PGGMagnigierView导入放大镜类 也可以在这里面进行镜框内容修改
2.声明属性 @property (nonatomic,strong) PGGMagnigierView *magnifyView;//放大镜View
3.在开始移动方法中 加入放大镜 并让其显示 同时创建定时器 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touchTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addView) userInfo:nil repeats:NO];
    if (self.magnifyView == nil) {
        self.magnifyView = [[PGGMagnigierView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.magnifyView.magnView = self.view;
    }
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint beginPoint = [touch locationInView:self.view];
    self.magnifyView.magnPoint = beginPoint;
        //    自动调用drawRect方法，这样可以拿到  UIGraphicsGetCurrentContext，就可以画画
    [self.magnifyView setNeedsDisplay];
}
4. 在移动方法中 设置其放大点 目的让其跟随手指进行移动 
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *touche = touches;
    UITouch *touch = [touche anyObject];
    self.magnifyView.magnPoint = [touch locationInView:self.view];//主要代码 放大点
    [self.magnifyView setNeedsDisplay];
}

  5.移动结束关闭定时器 对象置空 防泄漏 
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.touchTimer invalidate];
    self.touchTimer = nil;
    self.magnifyView = nil;
    self.magnifyView.magnView = nil;
}
