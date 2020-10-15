//
//  ZZBaseCollectionViewCell.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZZBaseCollectionViewCellClassDelegate <NSObject>

/// 注册
/// @param collectionView UICollectionView
+ (void)registerNibForCollectionView:(UICollectionView *)collectionView;

/// 从缓存中获取
/// @param collectionView UICollectionView
/// @param indexPath forIndexPath
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;


@optional
/// 获取cell的计算size
/// @param model NSObject
+(CGSize)cellSize:(id)model;

/// 获取cell的计算size
/// @param model NSObject
+(CGSize)cellSize:(UICollectionView *)collectionView model:(id)model;

@end

@interface ZZBaseCollectionViewCell : UICollectionViewCell<ZZBaseCollectionViewCellClassDelegate>

@end

NS_ASSUME_NONNULL_END
