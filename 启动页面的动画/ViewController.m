//
//  ViewController.m
//  启动页面的动画
//
//  Created by Zin_戦 on 16/6/11.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /*****************/
    UIWindow * window = [[UIApplication sharedApplication]keyWindow] ;
    
    UIImageView *welcome = [[UIImageView alloc]initWithFrame:window.bounds];
    NSLog(@"%@, %@",[self getLaunchImageName],window);
    [welcome setImage:[UIImage imageNamed:[self getLaunchImageName]]];
    
    //把背景图放在最上层
    
    [window addSubview:welcome];
    
    [window bringSubviewToFront:welcome];
    
    welcome.alpha = 0.99;
    
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        CGRect frame = welcome.frame;
        frame.size.width = window.bounds.size.width*1.3;
        frame.size.height = window.bounds.size.height*1.3;
        welcome.frame = frame;
        welcome.center = window.center;
        welcome.alpha = 0;
        //单纯放大
        //        welcome.transform = CGAffineTransformMakeScale(3, 3);
        
    } completion:^(BOOL finished) {
        
        [welcome removeFromSuperview];
        //    [self createNavgation];
        //    [self  setupRefresh];
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Linkin park";
}

- (NSString *)getLaunchImageName {
    
    //  CGSize viewSize = [[UIApplication sharedApplication]keyWindow].bounds.size;
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    // 竖屏
    NSString *viewOrientation = @"Portrait";
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
}

@end
