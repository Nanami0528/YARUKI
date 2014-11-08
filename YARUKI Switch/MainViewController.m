//
//  ViewController.m
//  YARUKI　Switch
//
//  Created by nanami on 2014/06/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize yaruki_time;
@synthesize taskName;
@synthesize taskId;
@synthesize tagNum;


- (void)viewDidLoad
{
    
    mainswich= 1;
    
    
    
    defaults = [NSUserDefaults standardUserDefaults];

    NSMutableArray *taskArry = [defaults objectForKey:@"yaruki_task"];
    
    if (taskArry == nil) {
        NSLog(@"タスクは存在しません");
    } else if ([taskArry count]==1) {
        if(tagNum==1){//ListVCからの値の取り出し方
            //NSDictionary                                                            ★
            NSMutableDictionary *taskDict = [taskArry objectAtIndex:taskId];
            NSString *stStr = [taskDict objectForKey:@"selecttime"];
            NSString *tStr = [taskDict objectForKey:@"time"];
            
            NSLog(@"時間　　%@ %@ tag:%d", stStr, tStr, tagNum);
            long st = [stStr longLongValue];
            long t = [tStr longLongValue];
            
            yaruki_time = st-t;
            sec = t;
            taskNameLabel.text = (NSString *)[taskDict objectForKey:@"name"];
            NSLog(@"%@",taskDict);
        }else if(tagNum==2){//SecondVCから
            //NSDictionary                                                            ★
            NSMutableDictionary *taskDict = [taskArry objectAtIndex:taskId-1];
            NSString *stStr = [taskDict objectForKey:@"selecttime"];
            NSString *tStr = [taskDict objectForKey:@"time"];
            
            NSLog(@"時間　　%@ %@ tag:%d", stStr, tStr, tagNum);
            long st = [stStr longLongValue];
            long t = [tStr longLongValue];
            
            yaruki_time = st-t;
            sec = [[taskArry.lastObject objectForKey:@"time"] longLongValue];
            taskNameLabel.text = (NSString *)[taskArry[self.taskId-1] objectForKey:@"name"];
            NSLog(@"%ld",sec);
        }
    
    } else {
        
        //NSDictionary                                                            ★
        NSMutableDictionary *taskDict = [taskArry objectAtIndex:taskId];
        NSString *stStr = [taskDict objectForKey:@"selecttime"];
        NSString *tStr = [taskDict objectForKey:@"time"];
        
        NSLog(@"時間　　%@ %@", stStr, tStr);
        long st = [stStr longLongValue];
        long t = [tStr longLongValue];
     
        yaruki_time = st-t;
        if(tagNum==1){//ListVCからの値の取り出し方
            sec = t;
            taskNameLabel.text = (NSString *)[taskDict objectForKey:@"name"];
            NSLog(@"%@",taskDict);
        }else if(tagNum==2){//SecondVCから
            
            sec = [[taskArry.lastObject objectForKey:@"time"] longLongValue];
            taskNameLabel.text = (NSString *)[taskArry[self.taskId] objectForKey:@"name"];
            NSLog(@"%ld",sec);
        }
        NSLog(@"%@",taskArry);
    
    
    }

    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    //sec= 0.0;
    
    
    minLabel.text = [NSString stringWithFormat:@"%2ld",(sec%3600)/60] ;
    secLabel.text = [NSString stringWithFormat:@"%2ld",(sec%3600)%60] ;
    hourLabel.text = [NSString stringWithFormat:@"%2ld",sec/3600] ;
    
    bar.transform = CGAffineTransformMakeScale(1.0, 14.0);
    bar.progress =  0.0  ;//ここ←
    bar.progressTintColor = [UIColor colorWithRed:0.0 green:0.94 blue:0.38 alpha:0.4];
    bar.trackTintColor = [UIColor colorWithRed:0.0 green:0.40 blue:0.19 alpha:0.2];
    
    
    secremaining.text = [NSString stringWithFormat:@"%.1ld",(yaruki_time%3600)%60];
    
    minremaining.text = [NSString stringWithFormat:@"%.1ld",(yaruki_time%3600)/60];
    
    hourremaining.text = [NSString stringWithFormat:@"%.1ld",yaruki_time/3600];
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)start
{
    if (![timer isValid] )//タイマーが動いていない場合
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(up)
                                               userInfo:nil
                                                repeats:YES
                 
                 ];
        
        [timer fire];
    }else{//タイマーが動いていた場合
        [timer invalidate];//タイマーを止める
        //TODO: sec,min,hourを渡す
        NSLog(@"sec:%ld",sec);
        bar.progress =(float) sec / yaruki_time;NSLog(@"yaruki_time: %.4f",bar.progress);
        NSMutableArray *taskArry = [[NSMutableArray alloc] init];
        //NSUserDefaultsにNSMutableArrayを保存すると、NSArray型になってしまう。
        //なので、NSUserDefaultsに保存した配列をMutable(可変長)な形で取り出したいときは、取り出したオブジェクトにたいして「mutableCopy」メソッドを付け加えてあげないとMutableにならない。
        taskArry = [[defaults objectForKey:@"yaruki_task"] mutableCopy];//
        
        if (taskArry == nil) {
            NSLog(@"タスクは存在しません");
        } else {
            
            NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
            NSDictionary *oldDict = (NSDictionary *)[taskArry objectAtIndex:taskId-1];
            [newDict addEntriesFromDictionary:oldDict];
            [newDict setObject:[NSString stringWithFormat:@"%ld", sec] forKey:@"time"];
            [taskArry replaceObjectAtIndex:taskId-1 withObject:newDict];
            
            [defaults setObject:taskArry forKey:@"yaruki_task"];
            [defaults synchronize];
        }
    }
    if(mainswich==0){

        [mainbottan setImage:[UIImage imageNamed:@"start2.gif"] forState:UIControlStateNormal];
        
        mainswich=1;
        
    }else if (mainswich==1) {
        
        

        [mainbottan setImage:[UIImage imageNamed:@"stop2.gif"] forState:UIControlStateNormal];

        mainswich=0;
      
        
    }
    
    
    
    
}




-(void)up
{
    NSLog(@"sec:%d",sec);
    
     bar.progress =(float) sec / yaruki_time;
    sec = sec+1;
    
    secLabel.text = [NSString stringWithFormat:@"%.2d",sec];
    
    long hourLabelNum = sec / 3600;
    long minLabelNum = (sec % 3600) / 60;
    long secLabelNum = (sec % 3600) % 60;
    
    hourLabel.text = [NSString stringWithFormat:@"%ld", hourLabelNum];
    minLabel.text = [NSString stringWithFormat:@"%ld", minLabelNum];
    secLabel.text = [NSString stringWithFormat:@"%ld", secLabelNum];
    
    
    long remainsec;
    remainsec=yaruki_time -   sec;
    
     secremaining.text = [NSString stringWithFormat:@"%ld",(remainsec%3600)%60];
    
     minremaining.text = [NSString stringWithFormat:@"%ld",(remainsec%3600)/60];
    
     hourremaining.text = [NSString stringWithFormat:@"%ld",remainsec/3600];
    
}


-(IBAction)back1{
    
    if (self.presentingViewController.presentingViewController) {
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}























@end
