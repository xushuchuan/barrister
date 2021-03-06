//
//  AddOrderFeedBackViewController.m
//  barrister
//
//  Created by 徐书传 on 16/7/3.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "AddOrderFeedBackViewController.h"
#import "OrderProxy.h"

@interface AddOrderFeedBackViewController ()

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) OrderProxy *proxy;

@end

@implementation AddOrderFeedBackViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configView];
}

-(void)configView
{
    
    
    self.title = @"添加总结";
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:RECT(LeftPadding, 10, 200, 15)];
    tipLabel.font = SystemFont(14.0f);
    tipLabel.textColor = KColorGray999;
    tipLabel.text = @"请填写您对此订单的总结内容";
    [self.view addSubview:tipLabel];
    
    [self.view addSubview:self.textView];
    
    [self.textView setFrame:RECT(LeftPadding, CGRectGetMaxY(tipLabel.frame) + 10, SCREENWIDTH - LeftPadding *2, 150)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = SystemFont(14.0f);
    btn.backgroundColor = kNavigationBarColor;
    btn.layer.cornerRadius = 3.0f;
    btn.layer.masksToBounds = YES;
    [btn setFrame:RECT(LeftPadding, CGRectGetMaxY(self.textView.frame) + 10, SCREENWIDTH - LeftPadding *2, 44)];
    [btn addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)commitAction
{
    __weak typeof(*&self)weakSelf = self;

    if (self.textView.text == nil || self.textView.text.length == 0) {
        [XuUItlity showFailedHint:@"请填写总结内容" completionBlock:nil];
        return;
    }
    if (!self.orderId) {
        [XuUItlity showFailedHint:@"数据异常" completionBlock:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
  
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:[BaseDataSingleton shareInstance].userModel.userId,@"userId",[BaseDataSingleton shareInstance].userModel.verifyCode,@"verifyCode",self.textView.text,@"content",self.orderId,@"orderId", nil];
    
    [XuUItlity showLoadingInView:self.view hintText:@"正在提交"];
    [self.proxy addXiaoJieWithParams:params Block:^(id returnData, BOOL success) {
        [XuUItlity hideLoading];
        if (success) {
            [XuUItlity showSucceedHint:@"提交成功" completionBlock:^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];

        }
        else
        {
            [XuUItlity showFailedHint:@"提交失败" completionBlock:nil];
        }

    }];

    
}


#pragma -mark --- Getter----
-(UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.layer.cornerRadius  = 5.0f;
        _textView.layer.borderColor = KColorGray999.CGColor;
        _textView.layer.borderWidth =  .1;
        _textView.textColor = KColorGray666;
        _textView.layer.masksToBounds = YES;
    }
    return _textView;
}


-(OrderProxy *)proxy
{
    if(!_proxy)
    {
        _proxy = [[OrderProxy alloc] init];
    }
    return _proxy;
}
@end
