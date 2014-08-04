//
//  ViewController.h
//  YARUKI　Switch
//
//  Created by nanami on 2014/06/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
  
    long sec;
    
    
    
   
    
    IBOutlet UILabel *minLabel;
    IBOutlet UILabel *secLabel;
    IBOutlet UILabel *hourLabel;
    IBOutlet UIProgressView *bar;
    
    
    
    
    
    NSTimer *timer;
    
    
    
    
    
    
    

    
 }


-(IBAction)start;



-(void)up;

-(IBAction)back1;

@property long yaruki_time;


@end
