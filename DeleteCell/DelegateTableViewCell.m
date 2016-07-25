//
//  DelegateTableViewCell.m
//  DeleteCell
//
//  Created by fengbai on 16/7/7.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import "DelegateTableViewCell.h"

@interface DelegateTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIView *swipeView;

@end

@implementation DelegateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.swipeView addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *swipRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipRight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.swipeView addGestureRecognizer:swipRight];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    _titleLable.text = titleStr;
}

- (IBAction)selectedButton:(UIButton *)sender {
    if (sender.tag == 12) {
        [self closeView];
    } else {
        if (self.deleteBlock) {
            self.deleteBlock(); // 删除
        }
        [self closeView];
    }
}

- (void)swipe:(UISwipeGestureRecognizer *)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self moveLeft];
        // 将其他打开的关闭
        if (self.swipeBlock) {
            self.swipeBlock();
        }
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self closeView];
    }
}

- (void)moveLeft{
    if (self.open) {
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.swipeView.transform = CGAffineTransformMakeTranslation(-88, 0);
    } completion:^(BOOL finished) {
        self.open = YES;
    }];
}

- (void)closeView{
    if (!self.open) {
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.swipeView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.open = NO;
    }];
}

@end
