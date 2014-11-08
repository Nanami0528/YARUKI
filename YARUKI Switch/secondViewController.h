//
//  secondViewController.h
//  YARUKI
//
//  Created by nanami on 2014/07/05.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface secondViewController : UIViewController

 <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    
    
    NSUserDefaults *defaults;
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *yarukiButton;

}

-(IBAction)back;
-(IBAction)yaruki;


@property (nonatomic) long yaruki_select_time;
@property(nonatomic) IBOutlet UITextField* taskNameField;
@end
