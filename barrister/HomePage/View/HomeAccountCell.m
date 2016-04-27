//
//  HomeAccountCell.m
//  barrister
//
//  Created by 徐书传 on 16/4/12.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "HomeAccountCell.h"
#import "HomeAccountItemView.h"
#define ItemViewHeight 70

@interface HomeAccountCell ()

@property (nonatomic,strong) HomeAccountItemView *leftView;
@property (nonatomic,strong) HomeAccountItemView *rightView;
@property (nonatomic,strong) UIButton *tixianBtn;

@end



@implementation HomeAccountCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        [self addSubview:[self getLineViewWithRect:RECT((SCREENWIDTH - 1)/2.0, 10, 1, ItemViewHeight - 20)]];
        [self addSubview:[self getLineViewWithRect:RECT(0, ItemViewHeight, SCREENWIDTH, 1)]];
        [self addSubview:self.tixianBtn];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
}


-(void)configData
{

}


+(CGFloat)getCellHeight
{
    return ItemViewHeight + 15 + 35 + 15;
}

#pragma -mark -----Getter------

-(HomeAccountItemView *)leftView
{
    if (!_leftView) {
        _leftView = [[HomeAccountItemView alloc] initWithFrame:RECT(0, 0, (SCREENWIDTH - 1)/2.0, ItemViewHeight) iconName:@"yue.png" titleStr:@"余额" subTitleStr:@"100"];
        
    }
    return _leftView;
}

-(HomeAccountItemView *)rightView
{
    if (!_rightView) {
        _rightView = [[HomeAccountItemView alloc] initWithFrame:RECT((SCREENWIDTH - 1)/2.0 + 1, 0, (SCREENWIDTH - 1)/2.0, ItemViewHeight) iconName:@"shuru.png" titleStr:@"总收入" subTitleStr:@"180"];
    }
    return _rightView;
}

-(UIButton *)tixianBtn
{
    if (!_tixianBtn) {
        _tixianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tixianBtn setFrame:RECT(SCREENWIDTH/4.0, ItemViewHeight + 15, SCREENWIDTH/2.0, 35)];
        [_tixianBtn setTitle:@"提现" forState:UIControlStateNormal];
        _tixianBtn.titleLabel.font = SystemFont(15.0f);
        [_tixianBtn setBackgroundColor:RGBCOLOR(250, 187, 47)];
        _tixianBtn.layer.cornerRadius = 17.5f;
        _tixianBtn.layer.masksToBounds = YES;
    }
    return _tixianBtn;
}

@end
