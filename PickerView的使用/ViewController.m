//
//  ViewController.m
//  PickerView的使用
//
//  Created by mac on 2019/9/29.
//  Copyright © 2019 Beijing Zijing Company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *furitLab;
@property (weak, nonatomic) IBOutlet UILabel *mainFoodLab;

@property (weak, nonatomic) IBOutlet UILabel *drinkingLab;
@end

@implementation ViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSString *bundleString = [[NSBundle mainBundle]pathForResource:@"foods" ofType:@"plist"];
        NSLog(@"bundleString = %@", bundleString);
        _dataArray = [NSArray arrayWithContentsOfFile:bundleString];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.pickerView selectRow:1 inComponent:0 animated:YES];
    [self.pickerView selectRow:1 inComponent:1 animated:YES];
    [self.pickerView selectRow:1 inComponent:2 animated:YES];
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        NSArray *array = self.dataArray[i];
        NSInteger index =  [self.pickerView selectedRowInComponent:i];
        NSString *string = array[index];
        switch (i) {
            case 0:
                self.furitLab.text = string;
                break;
                case 1:
                self.mainFoodLab.text = string;
                break;
                case 2:
                self.drinkingLab.text = string;
                break;
            default:
                break;
        }
        
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.dataArray.count;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *array = self.dataArray[component];
    return array.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 46;
}
/*
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:@"111"];
    return attributedString;
}

//如果实现返回字符串和View的方法,返回UIView的优先级较高
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 49)];
    v.backgroundColor = [UIColor redColor];
    return v;
}
*/
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *array = self.dataArray[component];
    NSString *string = array[row];
    return string;
}

//__func__ 返回当前方法在哪个类里面调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%s", __func__);
    NSArray *array = self.dataArray[component];
    NSString *string = array[row];
    switch (component) {
        case 0: {
            self.furitLab.text = string;
        
            break;
        }
        case 1: {
            self.mainFoodLab.text = string;
            break;
        }
            case 2:
            self.drinkingLab.text = string;
            break;
            
        default:
            break;
    }

    
    
}



@end


