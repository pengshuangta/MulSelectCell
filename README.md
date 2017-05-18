# MulSelectCell
tableview实现类似购物车商品多选按钮选中状态不会被刷新掉
三种方法简单的实现商品多选，当用户选中商品的时候，滚动tableview按钮的选中状态不会被刷新掉，主要的原理是不让cell使用复用。关键代码：
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    NSLog(@"%@",cell);
    if (cell == nil) {
        cell = [[GoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
    }
    [cell.selectBtn addTarget:self action:@selector(selectClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

方法一：利用按钮的selected属性来设置按钮的setimage，主要代码如下：
-(void)selectClicked:(UIButton *)button{

    if (button.selected) {
        [button setImage:[UIImage imageNamed:@"未选中"] forState:0];
        button.selected = NO;
    }
    else{
        [button setImage:[UIImage imageNamed:@"选中"] forState:0];
        button.selected = YES;
    }
}

方法二：把选中的按钮添加到一个集合中，主要代码如下：
-(void)selectClicked:(UIButton *)button{

    if ([_selectBtnSet containsObject:button]) {
        [button setImage:[UIImage imageNamed:@"未选中"] forState:0];
        [_selectBtnSet removeObject:button];
        
    }
    else{
        [button setImage:[UIImage imageNamed:@"选中"] forState:0];
        [_selectBtnSet addObject:button];
        
    }
}

方法三：因为按钮是添加在cell上的，通过点击的按钮可以获取当前的cell实例，然后在设置cell上的按钮属性（cell不能使用复用），主要代码如下：
-(void)selectClicked:(UIButton *)button{

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
