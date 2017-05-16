//
//  DIYAlertViewController.m
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import "DIYAlertViewController.h"
#import "DIYAlertView.h"
#import "DIYAlertSheet.h"

#define kDefaultLineHeight 50
#define kDefaultLineSpacing 10

#define kSelfHeight self.view.bounds.size.height
#define kSelfWidth self.view.bounds.size.width

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface DIYAlertViewController ()
/** 中心提示框 */
@property (nonatomic, strong) DIYAlertView *alertView;
/** 下方提示框 */
@property (nonatomic, strong) DIYAlertSheet *alertSheet;
@end

@implementation DIYAlertViewController
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}
#pragma mark - 方法 Methods
- (void)showAlertView{
    [self alertView];
    [UIView animateWithDuration:0.2 animations:^{
        self.alertView.alpha = 1.0;
    }];
}
- (void)showAlertSheet{
    [self alertSheet];
    [UIView animateWithDuration:0.2 animations:^{
        CGRect alertFrame = self.alertSheet.frame;
        alertFrame.origin.y -= (kDefaultLineHeight * 2 + kDefaultLineSpacing);
        self.alertSheet.frame = alertFrame;
//        [self.view layoutIfNeeded];
    }];

}
- (void)showAlertViewWithYesAction:(void (^)(void))yesAction cancelAction:(void (^)(void))cancelAction{
    [self showAlertView];
    self.alertView.yesBtnClickAction = ^(UIButton *sender) {
        yesAction();
    };
    self.alertView.cancelBtnClickAction = ^(UIButton *sender) {
        cancelAction();
    };
}
- (void)showAlertSheetWithYesAction:(void (^)(void))yesAction cancelAction:(void (^)(void))cancelAction{
    [self showAlertSheet];
    self.alertSheet.yesBtnClickAction = ^(UIButton *sender) {
        yesAction();
    };
    self.alertSheet.cancelBtnClickAction = ^(UIButton *sender) {
        cancelAction();
    };
}
- (void)hideAlertView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)hideAlertSheet{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect alertFrame = self.alertSheet.frame;
        alertFrame.origin.y += (kDefaultLineHeight * 2 + kDefaultLineSpacing);
        self.alertSheet.frame = alertFrame;
//        [self.view layoutIfNeeded];
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 懒加载 LazyLoad
- (DIYAlertView *)alertView{
    if (_alertView == nil) {
        _alertView = [[DIYAlertView alloc] init];
        [self.view addSubview:_alertView];
    }
    return _alertView;
}
- (DIYAlertSheet *)alertSheet{
    if (_alertSheet == nil) {
        _alertSheet = [[DIYAlertSheet alloc] init];
        [self.view addSubview:_alertSheet];

    }
    return _alertSheet;
}
@end
