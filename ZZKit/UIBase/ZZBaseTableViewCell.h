//
//  ZZBaseTableViewCell.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZZBaseTableViewCellClassDelegate <NSObject>

/*
/// 注册
/// @param tableView UITableView
+ (void)registerNibForTableView:(UITableView *)tableView;

/// 从缓存中获取
/// @param tableView UITableView
/// @param indexPath forIndexPath
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

/// 获取cell的计算高度
/// @param model NSObject
+(CGFloat)cellHeight:(id)model;
 
 */

@end

@interface ZZBaseTableViewCell : UITableViewCell<ZZBaseTableViewCellClassDelegate>

@end

NS_ASSUME_NONNULL_END
