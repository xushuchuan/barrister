//
//  HomePageProxy.h
//  barrister
//
//  Created by 徐书传 on 16/3/22.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "BaseNetProxy.h"

@interface HomePageProxy : BaseNetProxy

-(void)HomePageGetBannerDataWithParams:(NSDictionary *)dict;

@end
