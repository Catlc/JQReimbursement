//
//  JQTextInputCell.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/14.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "JQTextInputCell.h"

NSString * const JQFormRowDescriptorTypeTextField = @"JQFormRowDescriptorTypeTextField";


@implementation JQTextInputCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([JQTextInputCell class]) forKey:JQFormRowDescriptorTypeTextField];
 
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
- (void)update
{
    [super update];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
