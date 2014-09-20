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
    
    bar2.transform = CGAffineTransformMakeScale(1.0, 14.0);
    bar2.progress =  0.0  ;
    bar2.progressTintColor = [UIColor colorWithRed:1.00 green:1.00 blue:0.00 alpha:0.3];
    bar2.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    bar3.transform = CGAffineTransformMakeScale(1.0, 14.0);
    bar3.progress =  0.0  ;
    bar3.progressTintColor = [UIColor colorWithRed:4.00 green:0.40 blue:0.70 alpha:0.5];
    bar3.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    bar4.transform = CGAffineTransformMakeScale(1.0, 14.0);
    bar4.progress =  0.0  ;
    bar4.progressTintColor = [UIColor colorWithRed:1.0 green:0.34 blue:0.48 alpha:0.4];
    bar4.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    bar5.transform = CGAffineTransformMakeScale(1.0, 14.0);
    bar5.progress =  0.0  ;
    bar5.progressTintColor = [UIColor colorWithRed:0.60 green:0.84 blue:1.00 alpha:0.4];
    bar5.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    
    
    
    
    
    
    
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *taskArry = [defaults objectForKey:@"yaruki_task"];
    NSLog(@"%@",taskArry);

    //１番最後の配列の中身
    NSDictionary *dic = taskArry [[taskArry count] - 1];
    NSString *tStr = dic[@"time"];
    long time = [tStr longLongValue];
    
    NSString *stStr= dic[@"selecttime"];
    long selecttime = [stStr longLongValue];
    firstbar.progress = (float)time/selecttime;
    tasknameLabel.text =[dic objectForKey:@"name"];
    
    
    //最後から２番目配列の中身
    NSDictionary *dic2 = taskArry [[taskArry count] - 2];
    NSString *tStr2 = dic2[@"time"];
    long time2 = [tStr2 longLongValue];
    
    NSString *stStr2= dic2[@"selecttime"];
    long selecttime2 = [stStr2 longLongValue];
    bar2.progress = (float)time2/selecttime2;
    tasknameLabel2.text =[dic2 objectForKey:@"name"];

    //最後から３番目
    NSDictionary *dic3 = taskArry [[taskArry count] - 3];
    NSString *stStr3 = dic3[@"time"];
    long time3 = [stStr3 longLongValue];
    
    NSString *tStr3= dic3[@"selecttime"];
    long selecttime3 = [tStr3 longLongValue];
    bar3.progress = (float)time3/selecttime3;
    tasknameLabel3.text =[dic3 objectForKey:@"name"];
    
    //最後から４番目
    NSDictionary *dic4 = taskArry [[taskArry count] - 4];
    NSString *stStr4 = dic4[@"time"];
    long time4 = [stStr4 longLongValue];
    
    NSString *tStr4= dic4[@"selecttime"];
    long selecttime4 = [tStr4 longLongValue];
    bar4.progress = (float)time4/selecttime4;
    tasknameLabel4.text =[dic4 objectForKey:@"name"];
    
    //最後から５番目
    NSDictionary *dic5 = taskArry [[taskArry count] - 5];
    NSString *stStr5 = dic5[@"time"];
    long time5 = [stStr5 longLongValue];
    
    NSString *tStr5= dic[@"selecttime"];
    long selecttime5 = [tStr5 longLongValue];
    bar5.progress = (float)time5/selecttime5;
    tasknameLabel5.text =[dic5 objectForKey:@"name"];

    
    
//   tasknameLabel2.text =[dic objectForKey:@"name"];
//   tasknameLabel3.text =[dic objectForKey:@"name"];
//   tasknameLabel4.text =[dic objectForKey:@"name"];
//   tasknameLabel5.text =[dic objectForKey:@"name"];



    
    
    
    
    
    
    
    
    
    
    
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
