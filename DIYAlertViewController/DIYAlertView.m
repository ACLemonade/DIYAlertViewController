//
//  DIYAlertView.m
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import "DIYAlertView.h"

#define kDefaultLineHeight 50
#define kDefaultLineWidth 100

#define kSelfWidth self.bounds.size.width
#define kSelfHeight self.bounds.size.height

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface DIYAlertView ()
/** 确定按钮 */
@property (nonatomic, strong) UIButton *yesBtn;
/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;
@end

@implementation DIYAlertView

- (instancetype)init{
    if (self = [super init]) {
        CGFloat width = kDefaultLineWidth * 2;
        CGFloat height = kDefaultLineHeight * 3;
        self.frame = CGRectMake(kScreenW/2 - width/2, kScreenH/2 - height/2, width, height);
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0;
        [self yesBtn];
        [self cancelBtn];
    }
    return self;
}
- (void)yesAction:(UIButton *)sender{
    if (self.yesBtnClickAction) {
        self.yesBtnClickAction(sender);
    }
}
- (void)cancelAction:(UIButton *)sender{
    if (self.cancelBtnClickAction) {
        self.cancelBtnClickAction(sender);
    }
}
- (UIButton *)yesBtn{
    if (_yesBtn == nil) {
        _yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _yesBtn.frame = CGRectMake(0, kSelfHeight - kDefaultLineHeight, kDefaultLineWidth, kDefaultLineHeight);
        [self addSubview:_yesBtn];
        _yesBtn.backgroundColor = [UIColor whiteColor];
        [_yesBtn setTitle:@"确定" forState:UIControlStateNormal];
        _yesBtn.layer.borderWidth = 0.5;
        [_yesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_yesBtn addTarget:self action:@selector(yesAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesBtn;
}
- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(CGRectGetMaxX(self.yesBtn.frame), kSelfHeight - kDefaultLineHeight, kDefaultLineWidth, kDefaultLineHeight);
        [self addSubview:_cancelBtn];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancelBtn.layer.borderWidth = 0.5;
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
@end
