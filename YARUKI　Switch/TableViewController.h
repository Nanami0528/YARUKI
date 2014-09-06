//
//  Table ViewController.h
//  YARUKI
//
//  Created by nanami on 2014/08/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *table ;
    
    NSUserDefaults *defaults;
    NSMutableArray*taskArry ;
}


@end
