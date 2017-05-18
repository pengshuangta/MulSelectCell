//
//  SecondViewController.m
//  MulSelectCell
//
//  Created by 彭双塔 on 2017/5/17.
//  Copyright © 2017年 彭双塔. All rights reserved.
//

#import "SecondViewController.h"
#import "GoodsTableViewCell.h"
#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_secondTB;
    NSMutableSet *_selectBtnSet;
}


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _selectBtnSet = [[NSMutableSet alloc] init];
    
    if (!_secondTB) {
        _secondTB = [[UITableView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _secondTB.delegate = self;
        _secondTB.dataSource = self;
        [self.view addSubview:_secondTB];
        _secondTB.rowHeight = 80;
        _secondTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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
    //方法二：将选中的按钮放到一个集合中（cell不能使用复用)
    for (UIButton *button in _selectBtnSet) {
        if (button.tag - 100 == indexPath.row) {
            [cell.selectBtn setImage:[UIImage imageNamed:@"选中"] forState:0];
        }
    }
    return cell;
    
}
#pragma mark - 选中商品的点击事件
-(void)selectClicked:(UIButton *)button{
    //方法二：将选中的按钮放到一个集合中（cell不能使用复用）
    if ([_selectBtnSet containsObject:button]) {
        [button setImage:[UIImage imageNamed:@"未选中"] forState:0];
        [_selectBtnSet removeObject:button];
        
    }
    else{
        [button setImage:[UIImage imageNamed:@"选中"] forState:0];
        [_selectBtnSet addObject:button];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
