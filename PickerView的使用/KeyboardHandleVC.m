//
//  KeyboardHandleVC.m
//  PickerView的使用
//
//  Created by mac on 2019/9/30.
//  Copyright © 2019 Beijing Zijing Company. All rights reserved.
//

#import "KeyboardHandleVC.h"

@interface KeyboardHandleVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *birthField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (nonatomic, strong) UIDatePicker *picker;
@end

@implementation KeyboardHandleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.birthField.delegate = self;
    self.cityField.delegate = self;
    [self setUpBirthdayKeyboard];
}
- (void)setUpBirthdayKeyboard {
    self.picker = [[UIDatePicker alloc]init];
    self.picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.picker.datePickerMode = UIDatePickerModeDate;
    self.birthField.inputView = self.picker;
    self.picker.backgroundColor = [UIColor whiteColor];
    [self.picker addTarget:self action:@selector(valueChanged:) forControlEvents: UIControlEventValueChanged];
}

- (void)valueChanged: (UIDatePicker *)datePicker {
    NSLog(@"%@",datePicker.date);
    self.birthField.text = [self dateConversionDateString:datePicker.date];
}

- (NSString *)dateConversionDateString: (NSDate *)date {
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [format stringFromDate:date];
    return dateStr;
}

//文本框开始编辑的时候被调用
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //获取当前datePicker的日期
    self.birthField.text = [self dateConversionDateString:self.picker.date];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@--%@", string, NSStringFromRange(range));
    return NO;
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
