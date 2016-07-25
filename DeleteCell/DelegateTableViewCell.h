//
//  DelegateTableViewCell.h
//  DeleteCell
//
//  Created by fengbai on 16/7/7.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SwipeBlock)();
typedef void(^DeleteBlock)();
typedef void(^CancelBlock)();

@interface DelegateTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, assign) BOOL open;

@property (nonatomic, copy) SwipeBlock swipeBlock;
@property (nonatomic, copy) DeleteBlock deleteBlock;

- (void)closeView;

@end
