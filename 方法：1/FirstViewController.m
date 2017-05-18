//
//  FirstViewController.m
//  MulSelectCell
//
//  Created by 彭双塔 on 2017/5/17.
//  Copyright © 2017年 彭双塔. All rights reserved.
//

#import "FirstViewController.h"
#import "GoodsTableViewCell.h"
#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_firstTB;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_firstTB) {
        _firstTB = [[UITableView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _firstTB.delegate = self;
        _firstTB.dataSource = self;
        [self.view addSubview:_firstTB];
        _firstTB.rowHeight = 80;
        _firstTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
}
/*
 *** UITableViewDelegate,UITableViewDataSource
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //不使用重用，根据indexPath来加载cell实例
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    NSLog(@"%@",cell);
    if (cell == nil) {
        
        cell = [[GoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    [cell.selectBtn addTarget:self action:@selector(selectClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;

}
#pragma mark - 选中商品的点击事件
-(void)selectClicked:(UIButton *)button{
    //方法一：用按钮的selected来加载按钮的选中背景（cell不能使用复用）
    if (button.selected) {
        [button setImage:[UIImage imageNamed:@"未选中"] forState:0];
        button.selected = NO;
    }
    else{
        [button setImage:[UIImage imageNamed:@"选中"] forState:0];
        button.selected = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
