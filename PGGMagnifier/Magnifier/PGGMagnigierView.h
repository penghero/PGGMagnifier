//
//  PGGMagnigierView.h
//  PGGMagnifier
//
//  Created by 陈鹏 on 2017/11/3.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGGMagnigierView : UIWindow
    //放大的视图
@property (nonatomic,strong) UIView *magnView;
    //放大视图的中心点位置
@property (nonatomic,assign) CGPoint magnPoint;
@end
