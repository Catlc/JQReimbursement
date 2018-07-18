//
//  BasicInformationCell.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/14.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "BasicInformationCell.h"

NSString * const ZNFormRowDescriptorTypeSegment = @"ZNFormRowDescriptorTypeSegment";
NSString * const ZNFormRowDescriptorTypeTextField = @"ZNFormRowDescriptorTypeTextField";


@interface BasicInformationCell()
@property (weak, nonatomic) IBOutlet UILabel *bfTitleLable;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation BasicInformationCell


+(void)load
{
//    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([BasicInformationCell class]) forKey:ZNFormRowDescriptorTypeSegment];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([BasicInformationCell class]) forKey:ZNFormRowDescriptorTypeTextField];

}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
     
}
- (void)update
{
    [super update];
    
    self.bfTitleLable.text = self.rowDescriptor.title;
    switch ([self.rowDescriptor.value integerValue]) {
        case 0:
            {
                self.rightButton.selected = YES;
                [UIView animateWithDuration:0.2f animations:^{
                    if (self.rightImageView) {
                        self.rightImageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
                    }
                }];
            }
            break;
        case 1:
           {
               self.rightButton.selected = NO;
               [UIView animateWithDuration:0.2f animations:^{
                   if (self.rightImageView) {
                       self.rightImageView.transform = CGAffineTransformMakeRotation(0);
                   }
               }];

           }
            break;
            
        default:
            break;
    }
}
- (IBAction)rightBnClick:(id)sender {
    
    self.rowDescriptor.value = self.rightButton.selected?@"1":@"0";
    [self update];
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
