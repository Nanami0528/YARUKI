//
//  ListViewController.h
//  YARUKI
//
//  Created by nanami on 2014/08/08.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface ListViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *table ;
    
    NSUserDefaults *defaults;
    NSMutableArray*taskArry ;
    NSString *taskname;
}



@end
