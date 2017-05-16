//
//  DIYAlertSheet.m
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import "DIYAlertSheet.h"

#define kDefaultLineHeight 50
#define kDefaultLineSpacing 10

#define kSelfWidth self.bounds.size.width
#define kSelfHeight self.bounds.size.height

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface DIYAlertSheet ()
/** 确定按钮 */
@property (nonatomic, strong) UIButton *yesBtn;
/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;
@end

@implementation DIYAlertSheet

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, kScreenH, kScreenW, kDefaultLineHeight * 2 + kDefaultLineSpacing);
        self.backgroundColor = [UIColor clearColor];
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
        _yesBtn.frame = CGRectMake(0, 0, kSelfWidth, kDefaultLineHeight);
        [self addSubview:_yesBtn];
        _yesBtn.backgroundColor = [UIColor whiteColor];
        [_yesBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_yesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_yesBtn addTarget:self action:@selector(yesAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesBtn;
}
- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(0, kSelfHeight - kDefaultLineHeight, kSelfWidth, kDefaultLineHeight);
        [self addSubview:_cancelBtn];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
@end
