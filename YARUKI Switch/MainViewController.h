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
    
    IBOutlet UILabel  * secremaining;
    IBOutlet UILabel  * minremaining;
    IBOutlet UILabel  * hourremaining;
    
    IBOutlet UILabel *taskNameLabel;
    
    
    
    
    
    
    NSTimer *timer;
    
    
    
    
     NSUserDefaults *defaults;    
    

    
 }


-(IBAction)start;



-(void)up;

-(IBAction)back1;

@property long yaruki_time;
@property (strong, nonatomic) NSString *taskName;
@property (nonatomic) int taskId;
@property (nonatomic) int tagNum;
@end
