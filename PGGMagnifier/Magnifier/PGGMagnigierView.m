//
//  PGGMagnigierView.m
//  PGGMagnifier
//
//  Created by 陈鹏 on 2017/11/3.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "PGGMagnigierView.h"
#import <QuartzCore/QuartzCore.h>

#define CPW     [[UIScreen mainScreen] bounds].size.width
#define CPY     [[UIScreen mainScreen] bounds].size.height

@implementation PGGMagnigierView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.clipsToBounds = YES;
        [self setBackgroundColor:[UIColor clearColor]];
        self.contentMode = UIViewContentModeRedraw;
        self.windowLevel = UIWindowLevelAlert;
        UILabel *x = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x-25, self.center.y-25, 50, 50)];
        x.text = @"+";
        x.font = [UIFont systemFontOfSize:50];
        x.textAlignment = NSTextAlignmentCenter;
        x.backgroundColor = [UIColor clearColor];
        x.textColor = [UIColor redColor];
        [self addSubview:x];
        NSLog(@"%@",NSStringFromCGRect(self.frame));
    }
    return self;
}

- (void)setMagnPoint:(CGPoint)magnPoint{
    _magnPoint = magnPoint;
    self.center = CGPointMake(_magnPoint.x, _magnPoint.y-50);
}

- (void)drawRect:(CGRect)rect{
        //    返回一个非空的路径中的当前点 获得当前画板
    CGContextRef test = UIGraphicsGetCurrentContext();
        //    设置图形上下文的插值质量水平
    CGContextSetInterpolationQuality(test, kCGInterpolationHigh);
        //    填充画板
    CGContextFillRect(test, CGRectMake(0, 0, self.magnPoint.x*0.01, self.magnPoint.y*0.01));
    CGContextTranslateCTM(test,(self.magnPoint.x)*0.1,(self.magnPoint.y)*0.1);
        //    放大倍数
    CGContextScaleCTM(test, 5, 5);
        //    移动函数
    CGContextTranslateCTM(test, -1*(self.magnPoint.x), -1*(self.magnPoint.y));
        //把控制器的view的内容画到上下文当中.
    [self.magnView.layer renderInContext:test];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
