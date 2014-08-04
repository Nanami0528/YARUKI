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

- (void)viewDidLoad
{
    NSLog(@"//%d",self.yaruki_time);
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    sec= 0.0;
    
    
    minLabel.text = [NSString stringWithFormat:@"%2d",(sec%3600)/60] ;
    secLabel.text = [NSString stringWithFormat:@"%2d",(sec%3600)%60] ;
    hourLabel.text = [NSString stringWithFormat:@"%2d",sec/3600] ;
    
    bar.transform = CGAffineTransformMakeScale(1.0, 10.0);
    bar.progress =  0.0  ;//ここ←
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
        
        
    
        bar.progress =(float) sec / yaruki_time;
       //bar.progress =sec+min/60+hour/10*60/yaruki_time;
    
       
       //NSLog(@"sec+min*60+hour*60*60: %ld",sec*+min*60+hour*60*60);
       NSLog(@"yaruki_time: %.4f",bar.progress);
       //NSLog(@"sec+min*60+hour*60*60/yaruki_time: %d",(sec+min*60+hour*60*60)/yaruki_time);
       
       
       //NSLog(@"sec+min/60+hour/10*60:%d",sec+min/60+hour/10*60);
      // NSLog(@"yaruki_time:%d",yaruki_time);
       //NSLog(@"sec+min/60+hour/10*60/yaruki_time:%d",sec+min/60+hour/10*60/yaruki_time);
       
       
       
    }

   
    
}



    
-(void)up
{
    NSLog(@"sec:%d",sec);
    
     bar.progress =(float) sec / yaruki_time;
    sec = sec+1;
    
    secLabel.text = [NSString stringWithFormat:@"%.2d",sec];
    
    
    if(sec == 60){
        sec = sec-60;
        
        minLabel.text = [NSString stringWithFormat:@"%.2d",sec/60];

        NSLog(@"min:%d",sec/60);
    }
    
    if((sec%3600)/60 == 60){
        
        
        hourLabel.text = [NSString stringWithFormat:@"%.2d",sec/60*60];

        
          NSLog(@"hour:%d",sec/60*60);
    }
    
        
//    count =count + 0.01;
//    time1.text = [NSString stringWithFormat:@"%.2d",count];
    
    
}


-(IBAction)back1{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}










@end
