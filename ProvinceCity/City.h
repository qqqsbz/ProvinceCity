//
//  City.h
//  ProvinceCity
//
//  Created by coder on 15/11/13.
//  Copyright © 2015年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
@interface City : Model <MTLManagedObjectSerializing>

@property (assign, nonatomic) NSInteger ID;
@property (assign, nonatomic) NSInteger PID;
@property (assign, nonatomic) NSInteger ZipCode;
@property (strong, nonatomic) NSString  *CityName;

@end
