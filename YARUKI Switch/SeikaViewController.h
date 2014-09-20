//
//  SeikaViewController.h
//  YARUKI
//
//  Created by nanami on 2014/07/05.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeikaViewController : UIViewController
{
   IBOutlet UIProgressView *firstbar;
   IBOutlet UIProgressView *bar2;
   IBOutlet UIProgressView *bar3;
   IBOutlet UIProgressView *bar4;
   IBOutlet UIProgressView *bar5;



    
    
    
    
    
    
    NSUserDefaults *defaults;
    
    
    IBOutlet UILabel  * tasknameLabel;
    
    IBOutlet UILabel  * tasknameLabel2;
    
    IBOutlet UILabel  * tasknameLabel3;
 
    IBOutlet UILabel  * tasknameLabel4;

    IBOutlet UILabel  * tasknameLabel5;
    
    
    
}

-(IBAction)back2;


@end
