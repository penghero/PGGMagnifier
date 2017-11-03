//
//  PGGMagnigierView.h
//  PGGMagnifier
//
//  Created by 陈鹏 on 2017/11/3.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//使用中有问题 请前去GitHub与我联系 感谢您的使用
//对您有帮助的话 送我一颗星星可好
//GitHub地址 https://github.com/penghero/PGGMagnifier.git
#import <UIKit/UIKit.h>

@interface PGGMagnigierView : UIWindow
    //放大的视图
@property (nonatomic,strong) UIView *magnView;
    //放大视图的中心点位置
@property (nonatomic,assign) CGPoint magnPoint;
@end
