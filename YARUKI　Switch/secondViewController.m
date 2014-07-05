//
//  secondViewController.m
//  YARUKI
//
//  Created by nanami on 2014/07/05.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController
{
    UIPickerView *picker;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [self.view addSubview:picker];
}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

/**
 * 列のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 30.0;
            break;
            
        case 1: // 2列目
            return 100.0;
            break;
            
        case 2: // 3列目
            return 20.0;
            break;
            
        case 3: // 4列目
            return 50.0;
            break;
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return [NSString stringWithFormat:@"%d", row];
            break;
            
        case 1: // 2列目
            return [NSString stringWithFormat:@"%d時間", row];
            break;
            
        case 2: // 3列目
            return [NSString stringWithFormat:@"%d",  row];
            break;
            
        case 3: // 4列目
            return [NSString stringWithFormat:@"%d分", row];
            break;
            
            
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
    NSInteger val1 = [pickerView selectedRowInComponent:1];
    
    // 3列目の選択された行数を取得
    NSInteger val2 = [pickerView selectedRowInComponent:2];
    
    // 4列目の選択された行数を取得
    NSInteger val3 = [pickerView selectedRowInComponent:3];
    
    
    NSLog(@"1列目:%d行目が選択", val0);
    NSLog(@"2列目:%d行目が選択", val1);
    NSLog(@"3列目:%d行目が選択", val2);
    NSLog(@"4列目:%d行目が選択", val3);
};

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];

}







@end
