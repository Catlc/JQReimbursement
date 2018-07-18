//
//  JQLabeledTextFieldCell.h
//  JQReimbursement
//
//  Created by 李承 on 2018/7/14.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "XLFormBaseCell.h"
#import <UIKit/UIKit.h>

extern NSString *const XLFormTextFieldLengthPercentages;
extern NSString *const XLFormTextFieldMaxNumberOfCharacterss;
extern NSString * const JQFormRowDescriptorTypeTextField;


@interface JQLabeledTextFieldCell : XLFormBaseCell<XLFormReturnKeyProtocol>

@property (nonatomic, readonly) UILabel * textLabels;
@property (nonatomic, readonly) UITextField * textFields;

@property (nonatomic) NSNumber *textFieldLengthPercentages;
@property (nonatomic) NSNumber *textFieldMaxNumberOfCharacterss;


@end
 
