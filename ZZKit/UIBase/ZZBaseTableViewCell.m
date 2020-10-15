//
//  ZZBaseTableViewCell.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "ZZBaseTableViewCell.h"
#import "UIView+iPad.h"
//#import <YYKit/YYKit.h>

@implementation ZZBaseTableViewCell

/*
/// 注册
/// @param tableView tableView
+ (void)registerNibForTableView:(UITableView *)tableView{
    UINib *nib = [UINib nibWithNibName:self.nibName bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:self.className];
}

/// 从缓存中获取
/// @param tableView UITableView
/// @param indexPath forIndexPath
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath{
    id cell = [tableView dequeueReusableCellWithIdentifier:self.className forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:self.nibName owner:self options:nil] firstObject];
    }
    ((UITableViewCell *)cell).selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/// 获取cell的计算高度
/// @param model NSObject
+(CGFloat)cellHeight:(id)model{
    return 0;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
 */

@end
