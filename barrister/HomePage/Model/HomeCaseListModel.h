//
//  HomeCaseListModel.h
//  barrister
//
//  Created by 徐书传 on 16/7/10.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "BaseModel.h"


//addTime = "2016-05-19 00:00:00";
//area = "";
//caseInfo = "\U54a8\U8be2\Uff0c\U5a5a\U524d\U7236\U6bcd\U4e70\U623f\U7684";
//caseManager = "<null>";
//caseTypeId = "<null>";
//caseTypeName = "<null>";
//clearingInfo = "<null>";
//clearingTime = "<null>";
//clearingUser = "<null>";
//contact = "\U5973\U58eb";
//contactPhone = 13666809677;

//followUpInfo = "<null>";
//followUpUser = "<null>";
//followupTime = "<null>";
//id = 65;

//income = "<null>";
//interviewInfo = "<null>";
//interviewTime = "<null>";
//interviewer = "<null>";
//linkInfo = "<null>";
//linkLawyer = "<null>";
//linkTime = "<null>";

//signatory = "<null>";
//signatoryInfo = "<null>";
//signatoryTime = "<null>";
//status = "case.status.consulting";
//title = "\U54a8\U8be2\Uff0c\U5a5a\U524d\U7236\U6bcd\U4e70\U623f\U7684";

@interface HomeCaseListModel : BaseModel

@property (nonatomic,strong) NSString *addTime;
@property (nonatomic,strong) NSString *area;
@property (nonatomic,strong) NSString *caseInfo;
@property (nonatomic,strong) NSString *caseManager;
@property (nonatomic,strong) NSString *caseTypeId;
@property (nonatomic,strong) NSString *caseTypeName;
@property (nonatomic,strong) NSString *clearingInfo;
@property (nonatomic,strong) NSString *clearingTime;

@property (nonatomic,strong) NSString *clearingUser;
@property (nonatomic,strong) NSString *contact;
@property (nonatomic,strong) NSString *contactPhone;
@property (nonatomic,strong) NSString *caseId;

@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *followUpInfo;
@property (nonatomic,strong) NSString *followUpUser;
@property (nonatomic,strong) NSString *followupTime;

@property (nonatomic,strong) NSString *income;
@property (nonatomic,strong) NSString *interviewInfo;
@property (nonatomic,strong) NSString *interviewTime;
@property (nonatomic,strong) NSString *interviewer;
@property (nonatomic,strong) NSString *linkInfo;
@property (nonatomic,strong) NSString *linkLawyer;


@property (nonatomic,strong) NSString *signatory;
@property (nonatomic,strong) NSString *signatoryInfo;
@property (nonatomic,strong) NSString *signatoryTime;

@property (nonatomic,assign) CGFloat titleHeight;


@end