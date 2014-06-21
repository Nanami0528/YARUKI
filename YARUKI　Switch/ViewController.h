//
//  ViewController.h
//  YARUKI　Switch
//
//  Created by nanami on 2014/06/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    

    
    int min;
    int sec;
    int hour;
    
    IBOutlet UILabel *minLabel;
    IBOutlet UILabel *secLabel;
    IBOutlet UILabel *hourLabel;
    
    
    
    
    
    NSTimer *timer;

    
 }


-(IBAction)start;



-(void)up;


@end
