//
//  GoodsTableViewCell.m
//  MulSelectCell
//
//  Created by 彭双塔 on 2017/5/17.
//  Copyright © 2017年 彭双塔. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 80)];
        [_selectBtn setImage:[UIImage imageNamed:@"未选中"] forState:0];
        [self.contentView addSubview:_selectBtn];
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(40, 10, 60, 60)];
        img.image = [UIImage imageNamed:@"商品"];
        [self.contentView addSubview:img];
    }
    return self;
}
@end
