//
//  ListViewController.m
//  YARUKI
//
//  Created by nanami on 2014/08/08.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController//こっからした

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    defaults = [NSUserDefaults standardUserDefaults];
    
    taskArry = [defaults objectForKey:@"yaruki_task"];
    
    if (taskArry == nil) {
        NSLog(@"タスクは存在しません");
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"sdfghjk%lu",(unsigned long)[taskArry count]);
    return [taskArry count];                                           //to
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifire = @"Cell";                                             //to
    UITableViewCell *cell =[tableView
                           dequeueReusableCellWithIdentifier:cellIdentifire];
    if (!cell) {                                                                  //to
        cell = [[UITableViewCell alloc]initWithStyle:                             //to
                UITableViewCellStyleDefault reuseIdentifier:                     //to
                cellIdentifire];
        
    }
    UILabel *textlabel=(UILabel *)[cell viewWithTag:1];
    
    NSMutableDictionary*task = [taskArry objectAtIndex:[indexPath row]];
    NSLog(@"bbbbb%@",[task objectForKey:@"name"]);
    
    textlabel.text =[NSString stringWithFormat:@"%@",[task objectForKey:@"name"]];
   

    
    
    return cell;
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたセルを取得
    
    MainViewController *mainVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    mainVC.taskId = (int)[indexPath row];
    mainVC.tagNum = 1;
    [self presentViewController:mainVC animated:YES completion:nil];
    
}


@end
