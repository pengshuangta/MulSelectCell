//
//  ViewController.m
//  MulSelectCell
//
//  Created by 彭双塔 on 2017/5/17.
//  Copyright © 2017年 彭双塔. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mulSelectTB;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"实现类似购物车多选商品的三种方法";
    
    if (!_mulSelectTB) {
        _mulSelectTB = [[UITableView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _mulSelectTB.delegate = self;
        _mulSelectTB.dataSource = self;
        [self.view addSubview:_mulSelectTB];
        _mulSelectTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//不显示多余分割线
        
    }
}
/*
 *** UITableViewDelegate,UITableViewDataSource
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"方法：%lu",indexPath.row + 1];
    cell.detailTextLabel.text = @"点我";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FirstViewController *vc = [[FirstViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.navigationItem.title = @"方法：1";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        SecondViewController *vc = [[SecondViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.navigationItem.title = @"方法：2";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        ThirdViewController *vc = [[ThirdViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.navigationItem.title = @"方法：3";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
