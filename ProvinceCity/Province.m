//
//  Province.m
//  ProvinceCity
//
//  Created by coder on 15/11/10.
//  Copyright © 2015年 coder. All rights reserved.
//

#import "Province.h"
#import "City.h"

@implementation Province

+ (NSString *)managedObjectEntityName
{
    return NSStringFromClass(self);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{};//@{@"ID":@"Id",@"ProvinceName":@"provinceName"};
}

+ (NSValueTransformer *)citiesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[City class]];
}


@end
