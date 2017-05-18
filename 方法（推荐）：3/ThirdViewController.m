//
//  ThirdViewController.m
//  MulSelectCell
//
//  Created by 彭双塔 on 2017/5/17.
//  Copyright © 2017年 彭双塔. All rights reserved.
//

#import "ThirdViewController.h"
#import "GoodsTableViewCell.h"
#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_thirdTB;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_thirdTB) {
        _thirdTB = [[UITableView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _thirdTB.delegate = self;
        _thirdTB.dataSource = self;
        [self.view addSubview:_thirdTB];
        _thirdTB.rowHeight = 80;
        _thirdTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    GoodsTableViewCell *cell = (GoodsTableViewCell *)[[button superview] superview];
    if (cell.selectBtn.selected) {
        [cell.selectBtn setImage:[UIImage imageNamed:@"未选中"] forState:0];
        cell.selectBtn.selected = NO;
    }
    else{
        [cell.selectBtn setImage:[UIImage imageNamed:@"选中"] forState:0];
        cell.selectBtn.selected = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
