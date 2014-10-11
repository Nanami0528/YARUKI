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

@synthesize taskNameField;
@synthesize yaruki_select_time;

- (void)viewDidLoad
{
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    
    
    
    
    
    [super viewDidLoad];
    
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    taskNameField.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [self.view addSubview:picker];
    
    self.yaruki_select_time= 0;
    
    
    
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
    switch (component) {
        case 0: // 1列目
            return 101;
            break;
            
        case 1: // 2列目
            return 60;
            break;
            
        default:
            return 0;
            break;
    }
    
    
    
    
}

/**
 * 列のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 100.0;
            break;
            
        case 1: // 2列目
            return 100.0;
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
            NSLog(@"%d",row);
            return [NSString stringWithFormat:@"%d時間", row];
            break;
            
        case 1: // 2列目
            
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
    
    
    self.yaruki_select_time=val0*60*60 +val1*60 ;
    NSLog(@"%ld",self.yaruki_select_time);
    
    NSLog(@"1列目:%ld行目が選択", val0);
    NSLog(@"2列目:%ld行目が選択", val1);
    
};

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];

}


-(IBAction)yaruki{
    
    NSLog(@"osaretayo");
    
    
    NSLog(@"%@ %d", taskNameField.text, yaruki_select_time);
    
   //NSDictionary *taskDict= [NSDictionary dictionaryWithObjectsAndKeys:taskNameField.text, @"name", ★ [NSString stringWithFormat:@"%d", yaruki_select_time], @"selecttime", @"0", @"time",nil];
    
     NSMutableDictionary *taskDict= [ NSMutableDictionary  dictionaryWithObjectsAndKeys:taskNameField.text, @"name",[NSString stringWithFormat:@"%d", yaruki_select_time], @"selecttime", @"0", @"time",nil];
    
    
    NSLog(@"aaaaaaaaaaaa %@",[taskDict objectForKey:@"time"]);
    /*
     self.taskNameField.text, @"name",
     self.yaruki_select_time, @"selecttime",
                         0 , @"time",nil];
    
    */
    NSArray *taskArray = [defaults objectForKey:@"yaruki_task"];
    NSMutableArray *taskMutableArray = [taskArray mutableCopy];
    
    if (taskArray == nil) {
        taskArray = [[NSMutableArray alloc] initWithObjects:taskDict, nil];
        [defaults setObject:taskArray forKey:@"yaruki_task"];
    } else {
        [taskMutableArray addObject:taskDict];
        [defaults setObject:taskMutableArray forKey:@"yaruki_task"];
    }
    
    
    [defaults synchronize];
    
    //yaruki_task_8374823712367
    
    //NSDate *now = [NSDate date];
    //NSTimeInterval nowEpochSeconds = [now timeIntervalSince1970];
    
    //NSString *taskId = [NSString stringWithFormat:@"yaruki_task_%d", nowEpochSeconds];
    
    //[defaults setObject:task forKey:taskId];
                           
    MainViewController *mainVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];

    mainVC.taskId = (int)[taskArray count] - 1;
    mainVC.tagNum = 2;
    [self presentViewController:mainVC animated:YES completion:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    
    // キーボードを閉じる
    [sender resignFirstResponder];
    
    [defaults setObject:self.taskNameField.text forKey:@"name"];
    
    [defaults setInteger:self.yaruki_select_time forKey:@"selecttime"];
    
    
    
    return TRUE;
    
    
}





@end
