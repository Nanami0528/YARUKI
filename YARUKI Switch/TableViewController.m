//
//  Table ViewController.m
//  YARUKI
//
//  Created by nanami on 2014/08/07.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
    defaults= [NSUserDefaults standardUserDefaults];  // 取得]
    taskArry=[defaults objectForKey:@"yaruki_task"];
    

    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [taskArry count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSString*cellIdentifire = @"Cell";
    UITableViewCell*cell =[tableView
                           dequeueReusableCellWithIdentifier:cellIdentifire];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:
            UITableViewCellStyleDefault reuseIdentifier:
                cellIdentifire];
        
                
                
    }
    UILabel *textlabel=(UILabel *)[cell viewWithTag:1];
    
    NSDictionary*task = taskArry[indexPath.row];
    
    
    textlabel.text =[NSString stringWithFormat:@"%@",task[@"name"]];
    
    return cell;
    

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
