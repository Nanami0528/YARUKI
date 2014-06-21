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
    
    IBOutlet UILabel *countLabel ;//←後で消す
    
    int count;
    int count1;
    int count2;
    
    IBOutlet UILabel *time1;
    IBOutlet UILabel *time2;
    IBOutlet UILabel *time3;
    
    
    
    
    
    NSTimer *timer;

    
 }


-(IBAction)start;



-(void)up;


@end
