//
//  CollectionView.h
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

typedef void(^CallbackWithIndex)(NSInteger idx);

@property (nullable) CallbackWithIndex deleteCallback;
@property (nullable) CallbackWithIndex editCallback;
@property (nullable) void(^addCallback)(void);

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *placeholderItem;
@property (nonatomic, strong) UICollectionView *collectionView;

-(instancetype)initWithItems:(NSArray *)items andTitle:(NSString *)title;
-(instancetype)initWithItems:(NSArray *)items andTitle:(NSString *)title andPlaceholder:(NSString *)placeholder;

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section;
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath;
//- (UIContextMenuConfiguration *)collectionView:(UICollectionView *)collectionView
//    contextMenuConfigurationForItemAtIndexPath:(NSIndexPath *)indexPath
//                                         point:(CGPoint)point;
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
