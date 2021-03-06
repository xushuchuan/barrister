//
//  OrderProxy.h
//  barrister
//
//  Created by 徐书传 on 16/5/23.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "BaseNetProxy.h"

@interface OrderProxy : BaseNetProxy

/**
 *  获取订单列表
 *
 *  @param aParams
 *  @param aBlock  返回block
 */
-(void)getOrderListWithParams:(NSDictionary *)aParams Block:(ServiceCallBlock)aBlock;

/**
 *  获取订单详情
 *
 *  @param aParams <#aParams description#>
 *  @param aBlock  <#aBlock description#>
 */
-(void)getOrderDetailWithParams:(NSDictionary *)aParams Block:(ServiceCallBlock)aBlock;

/**
 *  律师填写小节
 *
 *  @param aParams <#aParams description#>
 *  @param aBlock  <#aBlock description#>
 */
-(void)addXiaoJieWithParams:(NSDictionary *)aParams Block:(ServiceCallBlock)aBlock;



/**
 *  同意取消订单
 *
 *  @param aParams
 *  @param aBlock
 */
-(void)agreeCancelOrderWithParams:(NSMutableDictionary *)aParams Block:(ServiceCallBlock)aBlock;


/**
 *  不同意取消订单
 *
 *  @param aParams
 *  @param aBlock
 */
-(void)unAgreeCancelOrderWithParams:(NSMutableDictionary *)aParams Block:(ServiceCallBlock)aBlock;


/**
 *  完成订单
 *
 *  @param aParams
 *  @param aBlock
 */
-(void)finishOrderWithParams:(NSMutableDictionary *)aParams Block:(ServiceCallBlock)aBlock;



/**
 *  拨打电话
 *
 *  @param aParams
 *  @param aBlock  
 */
-(void)makeCallWithParams:(NSMutableDictionary *)aParams Block:(ServiceCallBlock)aBlock;

@end
