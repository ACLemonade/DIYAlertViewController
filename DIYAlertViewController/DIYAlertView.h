//
//  DIYAlertView.h
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YesButtonClick)(UIButton *sender);

typedef void(^CancelButtonClick)(UIButton *sender);

@interface DIYAlertView : UIView
/** 点击"确定"按钮 */
@property (nonatomic, copy) YesButtonClick yesBtnClickAction;
/** 点击"取消"按钮 */
@property (nonatomic, strong) CancelButtonClick cancelBtnClickAction;

@end
