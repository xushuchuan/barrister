//
//  AppointContentViewController.h
//  barrister
//
//  Created by 徐书传 on 16/5/16.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "BaseViewController.h"
#import "AppointmentMoel.h"

@interface AppointContentViewController : BaseViewController

@property (nonatomic,strong) NSMutableArray *checkViewItems;

@property (nonatomic,strong) AppointmentMoel *model;

@end
