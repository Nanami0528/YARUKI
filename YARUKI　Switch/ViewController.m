//
//  ViewController.m
//  YARUKI　Switch
//
//  Created by nanami on 2014/06/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    min = 0.0;
    sec= 0.0;
    hour = 0.0;
    minLabel.text = [NSString stringWithFormat:@"%2d",min] ;
    secLabel.text = [NSString stringWithFormat:@"%2d",sec] ;
    hourLabel.text = [NSString stringWithFormat:@"%2d",hour] ;
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
    }
    
}



    
-(void)up
{
    NSLog(@"sec:%d",sec);
    sec = sec+1;
    secLabel.text = [NSString stringWithFormat:@"%.2d",sec];
    
    if(sec == 60){
        sec = sec-60;
        min = min+1;
        minLabel.text = [NSString stringWithFormat:@"%.2d",min];

        NSLog(@"min:%d",min);
    }
    
    if(min==60){
        min = min-60;
        hour = hour+1;
        hourLabel.text = [NSString stringWithFormat:@"%.2d",hour];

        
          NSLog(@"hour:%d",hour);
    }
        
//    count =count + 0.01;
//    time1.text = [NSString stringWithFormat:@"%.2d",count];
    
    
}









@end
