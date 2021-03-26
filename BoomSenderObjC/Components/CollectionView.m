//
//  CollectionView.m
//  BoomSenderObjC
//
//  Created by Teemu Penttinen on 18.3.2021.
//

#import "CollectionView.h"
#import "Masonry.h"
#import "DeviceItemCell.h"

@implementation CollectionView

-(instancetype)initWithItems:(NSArray *)items andTitle:(NSString *)title {
    
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    _items = items;
    [self setupView:title];
    
    return self;
}

-(instancetype)initWithItems:(NSArray *)items andTitle:(NSString *)title andPlaceholder:(NSString *)placeholder {
    
    self = [super initWithFrame:CGRectZero];
    if (!self) { return nil; }
    
    _items = items;
    _placeholderItem = placeholder;
    
    [self setupView:title];
    
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

-(void)setupView:(NSString *)title {
    
    UIStackView *titleStack = [UIStackView new];
    [titleStack setAxis:UILayoutConstraintAxisHorizontal];
    
    UILabel *listTitle = [UILabel new];
    [listTitle setText:title];
    [listTitle setTextColor:UIColor.whiteColor];
    [listTitle setFont:[UIFont systemFontOfSize:24]];
    
    UIButton *addButton = [UIButton new];
    [addButton setImage:[UIImage systemImageNamed:@"plus"] forState:UIControlStateNormal];
    [addButton setTintColor:UIColor.whiteColor];
    [addButton addAction:[UIAction actionWithHandler:^(UIAction *action) {
        NSLog(@"Asd");
    }] forControlEvents: UIControlEventTouchUpInside];
    
    UICollectionLayoutListConfiguration *config = [[UICollectionLayoutListConfiguration alloc]initWithAppearance:UICollectionLayoutListAppearancePlain];
    [config setBackgroundColor:[UIColor colorWithRed:36.0/255.0 green:35.0/255.0 blue:49.0/255.0 alpha:1]];
    UICollectionViewCompositionalLayout *layout = [UICollectionViewCompositionalLayout layoutWithListConfiguration:config];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [_collectionView registerClass:DeviceItemCell.class forCellWithReuseIdentifier:@"DeviceItemCell"];
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [titleStack addArrangedSubview:listTitle];
    [titleStack addArrangedSubview:addButton];
    
    [self addSubview:titleStack];
    [self addSubview:_collectionView];

    [titleStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.top.equalTo([self mas_top]);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([self mas_width]);
        make.top.equalTo([titleStack mas_bottom]);
        make.bottom.equalTo([self mas_bottom]);
    }];
    
}

-(void)reloadData {
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    if (_items.count == 0 && _placeholderItem != nil) {
        return 1;
    }
    
    return _items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DeviceItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeviceItemCell" forIndexPath: indexPath];

    if (_items.count == 0 && _placeholderItem != nil) {
        [cell.title setText:self.placeholderItem];
    }
    else {
        [cell.title setText:_items[indexPath.row]];
    }
    
    return cell;
}

- (UIContextMenuConfiguration *)collectionView:(UICollectionView *)collectionView
    contextMenuConfigurationForItemAtIndexPath:(NSIndexPath *)indexPath
                                         point:(CGPoint)point {
    
    __weak CollectionView *weakSelf = self;
    
    UIAction *delete = [UIAction actionWithTitle:@"Delete" image:[UIImage systemImageNamed:@"trash.fill"] identifier:@"deleteAction" handler:^(__kindof UIAction * _Nonnull action) {
        weakSelf.deleteCallback(indexPath.row);
    }];
    
    UIAction *edit = [UIAction actionWithTitle:@"Edit" image:[UIImage systemImageNamed:@"pencil"] identifier:@"editAction" handler:^(__kindof UIAction * _Nonnull action) {
        weakSelf.editCallback(indexPath.row);
    }];
    
    if (_items.count > 0) {
        return [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:nil actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> * _Nonnull suggestedActions) {
            return [UIMenu menuWithTitle:@"Actions" children:@[delete, edit]];
        }];
    }
    
    return nil;
}

@end
