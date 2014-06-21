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
    
    count = 0.0;
    time1.text = [NSString stringWithFormat:@"%2d",count] ;
    time2.text = [NSString stringWithFormat:@"%2d",count] ;
    time3.text = [NSString stringWithFormat:@"%2d",count] ;
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
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01
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


    count =count + 0.01;
    countLabel.text = [NSString stringWithFormat:@"%.2d",count];
}









@end
