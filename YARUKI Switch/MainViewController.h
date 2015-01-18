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
    
    
    
    //現在進んだ時間
    IBOutlet UILabel *secLabel;//　秒
    IBOutlet UILabel *minLabel;//　分
    IBOutlet UILabel *hourLabel;//　時間
    
    IBOutlet UIProgressView *bar;//あと何時間かのグラフ
    
    //残り時間
    IBOutlet UILabel  * secremaining;//　秒
    IBOutlet UILabel  * minremaining;//　分
    IBOutlet UILabel  * hourremaining;//　時間
    
    IBOutlet UILabel *taskNameLabel;//教科名
    
    //YARUKIスイッチ
    IBOutlet UIButton *mainbottan;
    BOOL mainswich;
    
    
    
    
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
