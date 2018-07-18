//
//  JQReimbursementDetailCell.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/15.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "JQReimbursementDetailCell.h"

NSString * const JQFormRowDescriptorTypeLableDetail = @"JQFormRowDescriptorTypeLableDetail";

@interface JQReimbursementDetailCell()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLables;
@property (weak, nonatomic) IBOutlet UILabel *numberLables;
@property (weak, nonatomic) IBOutlet UILabel *amountLables;

@end
@implementation JQReimbursementDetailCell
+(void)load{
    
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([JQReimbursementDetailCell class]) forKey:JQFormRowDescriptorTypeLableDetail];

}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
- (void)update
{
    [super update];
    
    self.titleLables.text = self.rowDescriptor.title;
    self.numberLables.text = self.rowDescriptor.value[@"number"];
    self.amountLables.text = self.rowDescriptor.value[@"amount"];
}


+ (CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor{
    
    return 44;
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
