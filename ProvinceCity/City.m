//
//  City.m
//  ProvinceCity
//
//  Created by coder on 15/11/13.
//  Copyright © 2015年 coder. All rights reserved.
//

#import "City.h"

@implementation City

+ (NSString *)managedObjectEntityName
{
    return NSStringFromClass(self);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{};//@{@"ID":@"Id",@"PId":@"pId",@"ZipCode":@"zipCode",@"CityName":@"cityName"};
}


@end
