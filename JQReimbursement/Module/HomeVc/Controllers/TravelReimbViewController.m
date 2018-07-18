//
//  TravelReimbViewController.m
//  JQReimbursement
//
//  Created by 李承 on 2018/7/10.
//  Copyright © 2018年 licheng. All rights reserved.
//

#import "TravelReimbViewController.h"
#import "XLForm.h"
#import "BasicInformationCell.h"
#import "JQTextInputCell.h"
#import "JQLabeledTextFieldCell.h"
#import "JQLableRightButtonCell.h"
#import "ReimbursementDetailViewController.h"
#import "JQReimbursementDetailCell.h"

NSString *const kName = @"name";
NSString *const kEmail = @"email";
NSString *const kTwitter = @"twitter";
NSString *const kZipCode = @"zipCode";
NSString *const kNumber = @"number";
NSString *const kInteger = @"integer";
NSString *const kDecimal = @"decimal";
NSString *const kPassword = @"password";
NSString *const kPhone = @"phone";
NSString *const kUrl = @"url";
NSString *const kTextView = @"textView";
NSString *const kNotes = @"notes";

@interface TravelReimbViewController ()

@end

@implementation TravelReimbViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm {
    // Implementation details covered in the next section.
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"差旅报销单"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
//    section.title = @"基本信息";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"status" rowType:ZNFormRowDescriptorTypeTextField title:@"基本信息"];
    row.value = @"1";
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"unit" rowType:XLFormRowDescriptorTypeSelectorPush title:@"所属单位"];
           row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
           row.selectorTitle = @"Repeat";
           row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                                   [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                                   [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                                   [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                                   [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                                   [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                                   ];
           [section addFormRow:row];

    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"number" rowType:JQFormRowDescriptorTypeLableTextField title:@"单据编号"];
//    row.disabled = @YES;
    [section addFormRow:row];
    [row.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:14] forKey:@"textFields.font"];


    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"date" rowType:JQFormRowDescriptorTypeLableTextField title:@"提单日期"];
//    row.disabled = @YES;
    [section addFormRow:row];
 
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"people" rowType:XLFormRowDescriptorTypeSelectorPush title:@"报销人"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
    row.selectorTitle = @"Repeat";
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                            ];
    [section addFormRow:row];
    
    row.required = YES;
    [section addFormRow:row];


    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"department" rowType:XLFormRowDescriptorTypeSelectorPush title:@"部门"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
    row.selectorTitle = @"Repeat";
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                            ];
    [section addFormRow:row];
    
    row.required = YES;
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"payment" rowType:XLFormRowDescriptorTypeSelectorPush title:@"支付方式"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
    row.selectorTitle = @"Repeat";
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                            ];
    [section addFormRow:row];
    
    row.required = YES;
    [section addFormRow:row];

    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"style" rowType:XLFormRowDescriptorTypeSelectorPush title:@"出差类型"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
    row.selectorTitle = @"Repeat";
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                            ];
    [section addFormRow:row];
    
    row.required = YES;
    [section addFormRow:row];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"subsidies" rowType:XLFormRowDescriptorTypeSelectorPush title:@"补助方式"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
    row.selectorTitle = @"Repeat";
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                            ];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kTextView rowType:XLFormRowDescriptorTypeTextView];
    [row.cellConfigAtConfigure setObject:@"报销说明" forKey:@"textView.placeholder"];
    [section addFormRow:row];

    
    // Second Section
    section = [XLFormSectionDescriptor formSection];
//    section.title = @"明细";
    [form addFormSection:section];
    
    XLFormRowDescriptor * detailRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:JQFormRowDescriptorTypeLableRightButton title:@"明细"];
    detailRow.required = YES;
    detailRow.value = @{@"title":@"添加报销明细"};
    __typeof(self) __weak weakSelf = self;
    detailRow.action.formBlock = ^(XLFormRowDescriptor * sender){
        [weakSelf.navigationController pushViewController:[ReimbursementDetailViewController new] animated:YES];
    };
    [section addFormRow:detailRow];
    
//    amount number
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:JQFormRowDescriptorTypeLableDetail title:@"补助"];
    row.required = YES;
    row.value = @{@"number":@"(1张)",@"amount":@"289.00"};
    [section addFormRow:row];
    
    // Second Section
    section = [XLFormSectionDescriptor formSection];
//    section.title = @"补助";
    [form addFormSection:section];
    
    XLFormRowDescriptor * subsidiesDetailRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"subsidiesDetail" rowType:JQFormRowDescriptorTypeLableRightButton title:@"补助"];
    subsidiesDetailRow.required = YES;
    subsidiesDetailRow.value = @{@"title":@"添加补助明细"};
    subsidiesDetailRow.action.formBlock = ^(XLFormRowDescriptor * sender){
        [weakSelf.navigationController pushViewController:[ReimbursementDetailViewController new] animated:YES];
    };
    [section addFormRow:subsidiesDetailRow];

    
    // Second Section
    section = [XLFormSectionDescriptor formSection];
//    section.title = @"金额";
    [form addFormSection:section];
    
    XLFormRowDescriptor * amountRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"amountDetail" rowType:JQFormRowDescriptorTypeLableRightButton title:@"金额"];
    amountRow.required = YES;
//    amountRow.value = @{@"title":@""};
    amountRow.action.formBlock = ^(XLFormRowDescriptor * sender){
        [weakSelf.navigationController pushViewController:[ReimbursementDetailViewController new] animated:YES];
    };
    [section addFormRow:amountRow];

    

    // Second Section
    section = [XLFormSectionDescriptor formSection];
//    section.title = @"收款人";
    [form addFormSection:section];
    
    XLFormRowDescriptor * payeeRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"payeeDetail" rowType:JQFormRowDescriptorTypeLableRightButton title:@"收款人"];
    payeeRow.required = YES;
    payeeRow.value = @{@"title":@"添加收款人"};
    payeeRow.action.formBlock = ^(XLFormRowDescriptor * sender){
        [weakSelf.navigationController pushViewController:[ReimbursementDetailViewController new] animated:YES];
    };
    [section addFormRow:payeeRow];

    self.form = form;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithTitle:@"Disable" style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(disableEnable:)];
    barButton.possibleTitles = [NSSet setWithObjects:@"Disable", @"Enable", nil];
    self.navigationItem.rightBarButtonItem = barButton;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = CGFLOAT_MIN;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44)];
    buttonView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:buttonView];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 54)];
    


}

-(void)disableEnable:(UIBarButtonItem *)button
{
   

    self.form.disabled = !self.form.disabled;
    [button setTitle:(self.form.disabled ? @"Enable" : @"Disable")];
    [self.tableView endEditing:YES];
    [self.tableView reloadData];
    

}

#pragma mark XLFormDescriptorDelegate
-(void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue{
    // super implmentation MUST be called
    [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
    
    if ([rowDescriptor.tag isEqualToString:@"status"]) {
        XLFormRowDescriptor *unitRowDescriptor = [self.form formRowWithTag:@"unit"];
        XLFormRowDescriptor *numberRowDescriptor = [self.form formRowWithTag:@"number"];
        XLFormRowDescriptor *dateRowDescriptor = [self.form formRowWithTag:@"date"];
        XLFormRowDescriptor *departmentRowDescriptor = [self.form formRowWithTag:@"department"];
        XLFormRowDescriptor *styleRowDescriptor = [self.form formRowWithTag:@"style"];
        XLFormRowDescriptor *subsidiesRowDescriptor = [self.form formRowWithTag:@"subsidies"];
        XLFormRowDescriptor *textViewRowDescriptor = [self.form formRowWithTag:kTextView];
        XLFormRowDescriptor *peopleRowDescriptor = [self.form formRowWithTag:@"people"];
        XLFormRowDescriptor *paymentRowDescriptor = [self.form formRowWithTag:@"payment"];

        if ([rowDescriptor.value isEqualToString:@"1"]) {
            textViewRowDescriptor.hidden = @NO;
            unitRowDescriptor.hidden = @NO;
            numberRowDescriptor.hidden = @NO;
            dateRowDescriptor.hidden = @NO;
            departmentRowDescriptor.hidden = @NO;
            styleRowDescriptor.hidden = @NO;
            subsidiesRowDescriptor.hidden = @NO;
            peopleRowDescriptor.hidden = @NO;
            paymentRowDescriptor.hidden = @NO;

        }else{
             textViewRowDescriptor.hidden = @YES;
            unitRowDescriptor.hidden = @YES;
            numberRowDescriptor.hidden = @YES;
            dateRowDescriptor.hidden = @YES;
            departmentRowDescriptor.hidden = @YES;
            styleRowDescriptor.hidden = @YES;
            subsidiesRowDescriptor.hidden = @YES;
            peopleRowDescriptor.hidden = @YES;
            paymentRowDescriptor.hidden = @YES;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
