//
//  ViewController.m
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import "ViewController.h"
#import "DIYAlertViewController.h"

@interface ViewController ()
/** 中央框按钮 */
@property (nonatomic, strong) UIButton *centerBtn;
/** 底部框按钮 */
@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation ViewController
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self centerBtn];
    [self bottomBtn];
}
#pragma mark - 方法 Methods
- (void)showAlertVC:(UIButton *)sender{
    NSLog(@"弹出显示框控制器");
    DIYAlertViewController *diyAlertVC = [[DIYAlertViewController alloc] init];
    diyAlertVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    diyAlertVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:diyAlertVC animated:NO completion:^{
        if (sender.tag == 1000) {
            [diyAlertVC showAlertViewWithYesAction:^{
                NSLog(@"中央显示框点击确认");
            } cancelAction:^{
                NSLog(@"中央显示框点击取消");
                [diyAlertVC hideAlertView];
            }];
        } else {
            [diyAlertVC showAlertSheetWithYesAction:^{
                NSLog(@"底部显示框点击确认");
            } cancelAction:^{
                NSLog(@"底部显示框点击取消");
                [diyAlertVC hideAlertSheet];
            }];
        }
    }];
}
#pragma mark - 懒加载 LazyLoad
- (UIButton *)centerBtn{
    if (_centerBtn == nil) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerBtn.frame = CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 100, 50, 200, 50);
        [self.view addSubview:_centerBtn];
        [_centerBtn setTitle:@"显示中央显示框" forState:UIControlStateNormal];
        [_centerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_centerBtn setBackgroundColor:[UIColor orangeColor]];
        _centerBtn.tag = 1000;
        [_centerBtn addTarget:self action:@selector(showAlertVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}
- (UIButton *)bottomBtn{
    if (_bottomBtn == nil) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomBtn.frame = CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 100, 120, 200, 50);
        [self.view addSubview:_bottomBtn];
        [_bottomBtn setTitle:@"显示底部显示框" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn setBackgroundColor:[UIColor purpleColor]];
        _bottomBtn.tag = 2000;
        [_bottomBtn addTarget:self action:@selector(showAlertVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}
@end
