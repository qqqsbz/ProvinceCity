//
//  Province.h
//  ProvinceCity
//
//  Created by coder on 15/11/10.
//  Copyright © 2015年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
@interface Province : Model <MTLManagedObjectSerializing>

@property (assign, nonatomic) NSInteger ID;
@property (strong, nonatomic) NSString  *ProvinceName;
@property (strong, nonatomic) NSArray   *cities;
@property (assign, nonatomic) BOOL      isOpen;

@end
