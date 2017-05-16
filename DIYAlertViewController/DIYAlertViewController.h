//
//  DIYAlertViewController.h
//  DIYAlertViewController
//
//  Created by Lemonade on 2017/5/16.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DIYAlertViewController : UIViewController
/** 显示中央提示框 */
- (void)showAlertViewWithYesAction:(void(^)(void))yesAction cancelAction:(void(^)(void))cancelAction;
/** 显示底部提示框 */
- (void)showAlertSheetWithYesAction:(void(^)(void))yesAction cancelAction:(void(^)(void))cancelAction;
/** 隐藏中央提示框 */
- (void)hideAlertView;
/** 隐藏底部提示框 */
- (void)hideAlertSheet;
@end
