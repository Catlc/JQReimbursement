//
//  JQLabeledTextFieldCell.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/14.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "JQLabeledTextFieldCell.h"
#import "UIView+XLFormAdditions.h"
#import "XLFormRowDescriptor.h"
#import "XLForm.h"

NSString *const XLFormTextFieldLengthPercentages = @"textFieldLengthPercentages";
NSString *const XLFormTextFieldMaxNumberOfCharacterss = @"textFieldMaxNumberOfCharacterss";
NSString * const JQFormRowDescriptorTypeTextField = @"JQFormRowDescriptorTypeTextField";

@interface JQLabeledTextFieldCell() <UITextFieldDelegate>

@property NSMutableArray * dynamicCustomConstraints;

@end

@implementation JQLabeledTextFieldCell

@synthesize textFields = _textFields;
@synthesize textLabels = _textLabels;
@synthesize returnKeyType = _returnKeyType;
@synthesize nextReturnKeyType = _nextReturnKeyType;

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([JQLabeledTextFieldCell class]) forKey:JQFormRowDescriptorTypeTextField];
}
//#pragma mark - KVO
//
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ((object == self.textLabel && [keyPath isEqualToString:@"text"]) ||  (object == self.imageView && [keyPath isEqualToString:@"image"])){
//        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeSetting)]){
//            [self.contentView setNeedsUpdateConstraints];
//        }
//    }
//}
//
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        _returnKeyType = UIReturnKeyDefault;
//        _nextReturnKeyType = UIReturnKeyNext;
//    }
//    return self;
//}

//
//-(void)dealloc
//{
//    [self.textLabel removeObserver:self forKeyPath:@"text"];
//    [self.imageView removeObserver:self forKeyPath:@"image"];
//}
//
//#pragma mark - XLFormDescriptorCell
//
//-(void)configure
//{
//    [super configure];
//    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
//    [self.contentView addSubview:self.textLabel];
//    [self.contentView addSubview:self.textField];
//    [self.contentView addConstraints:[self layoutConstraints]];
//    [self.textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
//    [self.imageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
//    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//}
//
//-(void)update
//{
//    [super update];
//    self.textField.delegate = self;
//    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeText]){
//        self.textField.autocorrectionType = UITextAutocorrectionTypeDefault;
//        self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
//    }
//
//    self.textLabel.text = ((self.rowDescriptor.required && self.rowDescriptor.title && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle) ? [NSString stringWithFormat:@"%@*", self.rowDescriptor.title] : self.rowDescriptor.title);
//
//    self.textField.text = self.rowDescriptor.value ? [self.rowDescriptor displayTextValue] : self.rowDescriptor.noValueDisplayText;
//    [self.textField setEnabled:!self.rowDescriptor.isDisabled];
//    self.textField.textColor = self.rowDescriptor.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
//    self.textField.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//}
//
//-(BOOL)formDescriptorCellCanBecomeFirstResponder
//{
//    return (!self.rowDescriptor.isDisabled);
//}
//
//-(BOOL)formDescriptorCellBecomeFirstResponder
//{
//    return [self.textField becomeFirstResponder];
//}
//
//-(void)highlight
//{
//    [super highlight];
//    self.textLabel.textColor = self.tintColor;
//}
//
//-(void)unhighlight
//{
//    [super unhighlight];
//    [self.formViewController updateFormRow:self.rowDescriptor];
//}
//
//#pragma mark - Properties
//
//-(UILabel *)textLabel
//{
//    if (_textLabels) return _textLabels;
//    _textLabels = [UILabel autolayoutView];
//    return _textLabels;
//}
//
//-(UITextField *)textField
//{
//    if (_textFields) return _textFields;
//    _textFields = [UITextField autolayoutView];
//    return _textFields;
//}
//
//#pragma mark - LayoutConstraints
//
//-(NSArray *)layoutConstraints
//{
//    NSMutableArray * result = [[NSMutableArray alloc] init];
//    [self.textLabel setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];
//    [self.textLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisHorizontal];
//
//    // Add Constraints
//    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[_textField]-(margin)-|"
//                                                                        options:NSLayoutFormatAlignAllBaseline
//                                                                        metrics:[NSDictionary dictionaryWithObjectsAndKeys:@(11.0), @"margin", nil]
//                                                                          views:NSDictionaryOfVariableBindings(_textFields)]];
//    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[_textLabel]-(margin)-|"
//                                                                        options:NSLayoutFormatAlignAllBaseline
//                                                                        metrics:[NSDictionary dictionaryWithObjectsAndKeys:@(11.0), @"margin", nil]
//                                                                          views:NSDictionaryOfVariableBindings(_textLabels)]];
//
//    return result;
//}
//
//-(void)updateConstraints
//{
//    if (self.dynamicCustomConstraints){
//        [self.contentView removeConstraints:self.dynamicCustomConstraints];
//    }
//    NSMutableDictionary * views = [[NSMutableDictionary alloc] initWithDictionary: @{@"label": self.textLabel, @"textField": self.textField}];
//    if (self.imageView.image){
//        views[@"image"] = self.imageView;
//        if (self.textLabel.text.length > 0){
//            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image]-[label]-[textField]-|" options:0 metrics:nil views:views]];
//            [self.dynamicCustomConstraints addObject:[NSLayoutConstraint constraintWithItem:_textFields
//                                                                                  attribute:NSLayoutAttributeWidth
//                                                                                  relatedBy:self.textFieldLengthPercentages ? NSLayoutRelationEqual : NSLayoutRelationGreaterThanOrEqual
//                                                                                     toItem:self.contentView
//                                                                                  attribute:NSLayoutAttributeWidth
//                                                                                 multiplier:self.textFieldLengthPercentages ? [self.textFieldLengthPercentages floatValue] : 0.3
//                                                                                   constant:0.0]];
//        }
//        else{
//            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image]-[textField]-|" options:0 metrics:nil views:views]];
//        }
//    }
//    else{
//        if (self.textLabel.text.length > 0){
//            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-[textField]-|" options:0 metrics:nil views:views]];
//            [self.dynamicCustomConstraints addObject:[NSLayoutConstraint constraintWithItem:_textFields
//                                                                                  attribute:NSLayoutAttributeWidth
//                                                                                  relatedBy:self.textFieldLengthPercentages ? NSLayoutRelationEqual : NSLayoutRelationGreaterThanOrEqual
//                                                                                     toItem:self.contentView
//                                                                                  attribute:NSLayoutAttributeWidth
//                                                                                 multiplier:self.textFieldLengthPercentages ? [self.textFieldLengthPercentages floatValue] : 0.3
//                                                                                   constant:0.0]];
//        }
//        else{
//            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textField]-|" options:0 metrics:nil views:views]];
//        }
//    }
//
//    [self.contentView addConstraints:self.dynamicCustomConstraints];
//    [super updateConstraints];
//}
//
//
//#pragma mark - UITextFieldDelegate
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField
//{
//    return [self.formViewController textFieldShouldClear:textField];
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    return [self.formViewController textFieldShouldReturn:textField];
//}
//
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    return [self.formViewController textFieldShouldBeginEditing:textField];
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    return [self.formViewController textFieldShouldEndEditing:textField];
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (self.textFieldMaxNumberOfCharacterss) {
//        // Check maximum length requirement
//        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        if (newString.length > self.textFieldMaxNumberOfCharacterss.integerValue) {
//            return NO;
//        }
//    }
//
//    // Otherwise, leave response to view controller
//    return [self.formViewController textField:textField shouldChangeCharactersInRange:range replacementString:string];
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    [self.formViewController beginEditing:self.rowDescriptor];
//    [self.formViewController textFieldDidBeginEditing:textField];
//    // set the input to the raw value if we have a formatter and it shouldn't be used during input
//    if (self.rowDescriptor.valueFormatter) {
//        self.textField.text = [self.rowDescriptor editTextValue];
//    }
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    // process text change before we stick a formatted value in the UITextField
//    [self textFieldDidChange:textField];
//
//    // losing input, replace the text field with the formatted value
//    if (self.rowDescriptor.valueFormatter) {
//        self.textField.text = [self.rowDescriptor.value displayText];
//    }
//
//    [self.formViewController endEditing:self.rowDescriptor];
//    [self.formViewController textFieldDidEndEditing:textField];
//}
//
//
//#pragma mark - Helper
//
//- (void)textFieldDidChange:(UITextField *)textField{
//    if([self.textField.text length] > 0) {
//        BOOL didUseFormatter = NO;
//
//        if (self.rowDescriptor.valueFormatter && self.rowDescriptor.useValueFormatterDuringInput)
//        {
//            // use generic getObjectValue:forString:errorDescription and stringForObjectValue
//            NSString *errorDescription = nil;
//            NSString *objectValue = nil;
//
//            if ([ self.rowDescriptor.valueFormatter getObjectValue:&objectValue forString:textField.text errorDescription:&errorDescription]) {
//                NSString *formattedValue = [self.rowDescriptor.valueFormatter stringForObjectValue:objectValue];
//
//                self.rowDescriptor.value = objectValue;
//                textField.text = formattedValue;
//                didUseFormatter = YES;
//            }
//        }
//
//        // only do this conversion if we didn't use the formatter
//        if (!didUseFormatter)
//        {
//            if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeNumber] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDecimal]){
//                self.rowDescriptor.value =  [NSDecimalNumber decimalNumberWithString:self.textField.text locale:NSLocale.currentLocale];
//            } else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeInteger]){
//                self.rowDescriptor.value = @([self.textField.text integerValue]);
//            } else {
//                self.rowDescriptor.value = self.textField.text;
//            }
//        }
//    } else {
//        self.rowDescriptor.value = nil;
//    }
//}
//
//-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType
//{
//    _returnKeyType = returnKeyType;
//    self.textField.returnKeyType = returnKeyType;
//}
//
//-(UIReturnKeyType)returnKeyType
//{
//    return _returnKeyType;
//}
@end
