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

 <UIPickerViewDelegate, UIPickerViewDataSource>

{}

-(IBAction)back;
-(IBAction)yaruki;

@property long yaruki_select_time;

@end
