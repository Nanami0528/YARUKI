//
//  SeikaViewController.m
//  YARUKI
//
//  Created by nanami on 2014/07/05.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "SeikaViewController.h"

@interface SeikaViewController ()

@end

@implementation SeikaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    firstbar.transform = CGAffineTransformMakeScale(1.0, 14.0);
    firstbar.progress =  0.0  ;//ここ←
    firstbar.progressTintColor = [UIColor colorWithRed:0.0 green:0.94 blue:0.38 alpha:0.4];
    firstbar.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *taskArry = [defaults objectForKey:@"yaruki_task"];
    NSLog(@"%@",taskArry);
//    firstbar.progress =
    
    NSDictionary *dic = taskArry [4];
    long time = dic[@"time"];
    NSLog(@"%ld",time);
    NSLog(@"時間: %.1ld",(time%3600)/60);
    long time2 = dic[@"selecttime"];
    NSLog(@"%ld",time2);
    NSLog(@"時間: %.1ld",time2%3600);
    NSString *str  = [dic objectForKey:@"name"];
        NSLog(@"%@",str);
    
    int selecttime = 60;
    int time5 = 30;
    firstbar.progress = selecttime;
    
    firstbar.progress= (float)time5/selecttime;
    
   tasknameLabel.text =[dic objectForKey:@"name"];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(IBAction)back2{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




@end
