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
    NSUserDefaults *defaults;
    
    
    IBOutlet UILabel  * tasknameLabel;

    
    
    
}

-(IBAction)back2;


@end
