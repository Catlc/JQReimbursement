
//
//  JQLableRightButtonCell.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/15.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "JQLableRightButtonCell.h"

NSString * const JQFormRowDescriptorTypeLableRightButton = @"JQFormRowDescriptorTypeLableRightButton";


@interface JQLableRightButtonCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLables;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation JQLableRightButtonCell

- (IBAction)rightBtnClick:(id)sender {
    if (!self.rowDescriptor.value[@"title"]) {
        return;
    }
    if (self.rowDescriptor.action.formBlock){
        self.rowDescriptor.action.formBlock(self.rowDescriptor);
    }
}

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([JQLableRightButtonCell class]) forKey:JQFormRowDescriptorTypeLableRightButton];
    
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
    [self.rightButton setTitle:self.rowDescriptor.value[@"title"] forState:UIControlStateNormal];
    
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
