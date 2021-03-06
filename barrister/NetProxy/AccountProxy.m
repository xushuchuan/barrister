//
//  AccountProxy.m
//  barrister
//
//  Created by 徐书传 on 16/5/30.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "AccountProxy.h"

#define MyAccountUrl @"myAccount.do"
#define AccountDetialUrl @"getIncomeDetailList.do"
#define TixianUrl @"getMoney.do"
#define BindBankCardUrl @"bindBankCard.do"
#define SettingPriceUrl @"fitPrice.do"
#define IsExpertUrl     @"isExpert.do"

@implementation AccountProxy

/**
 *  获取我的账户信息
 *
 *  @param params 参数
 *  @param aBlock nil
 */

-(void)getMyAccountDataWithParams:(NSDictionary *)params Block:(ServiceCallBlock)aBlock
{
    [XuNetWorking postWithUrl:MyAccountUrl params:params success:^(id response) {
        if ([self isCommonCorrectResultCodeWithResponse:response]) {
            if (aBlock) {
                aBlock(response,YES);
            }
        }
        else
        {
            aBlock(CommonNetErrorTip,NO);
        }
        
    } fail:^(NSError *error) {
        
        aBlock(CommonNetErrorTip,NO);
    }];
}



/**
 *  绑定银行卡
 userId,verifyCode,cardNum（卡号）,cardholderName（持卡人姓名），bankName(银行名称)，bankAddress(开户行)
 */
-(void)bindCarkWithParams:(NSMutableDictionary *)params block:(ServiceCallBlock)aBlock
{
    [XuNetWorking getWithUrl:BindBankCardUrl params:params success:^(id response) {
        if ([self isCommonCorrectResultCodeWithResponse:response]) {
            if (aBlock) {
                aBlock(response,YES);
            }
        }

    } fail:^(NSError *error) {
        if (aBlock) {
            aBlock(CommonNetErrorTip,YES);
        }
        
    }];

}

-(void)getAccountDetailDataWithParams:(NSMutableDictionary *)params Block:(ServiceCallBlock)aBlock
{
    [self appendCommonParamsWithDict:params];
    [XuNetWorking getWithUrl:AccountDetialUrl params:params success:^(id response) {
        if (aBlock) {
            aBlock(response,YES);
        }
    } fail:^(NSError *error) {
        if (aBlock) {
            aBlock(CommonNetErrorTip,NO);
        }

    }];
}

-(void)tiXianActionWithMoney:(NSMutableDictionary *)params Block:(ServiceCallBlock)aBlock
{
    [self appendCommonParamsWithDict:params];
    [XuNetWorking postWithUrl:TixianUrl params:params success:^(id response) {
        if ([self isCommonCorrectResultCodeWithResponse:response]) {
            aBlock(response ,YES);
        }
        else
        {
            NSString *str = [response objectForKey:@"resultMsg"];
            aBlock(str,NO);
        }
    } fail:^(NSError *error) {
        
        aBlock(CommonNetErrorTip,NO);
    }];
}


/**
 修改服务价格
 
 @param params 参数
 @param aBlock 回调block
 */

-(void)changePriceWithParams:(NSMutableDictionary *)params block:(ServiceCallBlock)aBlock
{
    [self appendCommonParamsWithDict:params];
    [XuNetWorking postWithUrl:SettingPriceUrl params:params success:^(id response) {
        if ([self isCommonCorrectResultCodeWithResponse:response]) {
            aBlock(response ,YES);
        }
        else
        {
            NSString *str = [response objectForKey:@"resultMsg"];
            aBlock(str,NO);
        }
    } fail:^(NSError *error) {
        
        aBlock(CommonNetErrorTip,NO);
    }];
}

/**
 请求是否是专家
 
 @param params
 @param aBlock
 */
-(void)getIsExpertDataWithParams:(NSMutableDictionary *)params block:(ServiceCallBlock)aBlock
{

    [self appendCommonParamsWithDict:params];
    [XuNetWorking postWithUrl:IsExpertUrl params:params success:^(id response) {
        if ([self isCommonCorrectResultCodeWithResponse:response]) {
            aBlock(response ,YES);
        }
        else
        {
            NSString *str = [response objectForKey:@"resultMsg"];
            aBlock(str,NO);
        }
    } fail:^(NSError *error) {
        
        aBlock(CommonNetErrorTip,NO);
    }];
}



-(void)getCardInfoWithCardNum:(NSString *)cardNum WithBlock:(ServiceCallBlock)aBlock
{
    NSString *httpUrl = @"http://apis.baidu.com/datatiny/cardinfo/cardinfo";
    
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?cardnum=%@", httpUrl, cardNum];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"732bbaf70af9fc28eaad5c5d28991262" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                                   if (aBlock) {
                                       aBlock(error,NO);
                                   }
                                   
                               } else {
//                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
//                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                                   NSString *status = [jsonObject objectForKey:@"status"];
                                   if ([NSString stringWithFormat:@"%@",status].intValue == 1) {
                                       NSDictionary *dataDict = [jsonObject objectForKey:@"data"];
                                       aBlock(dataDict,YES);
                                   }
                                   else
                                   {
                                       aBlock(nil,NO);
                                   }
                               }
                           }];
}

@end
