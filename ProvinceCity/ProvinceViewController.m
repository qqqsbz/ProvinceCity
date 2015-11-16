//
//  ProvinceViewController.m
//  ProvinceCity
//
//  Created by coder on 15/11/10.
//  Copyright © 2015年 coder. All rights reserved.
//

#import "ProvinceViewController.h"
#import "Province.h"
#import "City.h"
#import "HeaderView.h"
#import "UIImage+RTTint.h"
@interface ProvinceViewController ()
{
    NSArray *datas;
}
@end
static NSString *reuseIdentifier = @"Cell";
@implementation ProvinceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Provineces" ofType:@"plist"];
    datas = [[NSArray alloc] initWithContentsOfFile:path];
    
    NSError *error;
    datas = [MTLJSONAdapter modelsOfClass:[Province class] fromJSONArray:datas error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Province *province = datas[section];
    if (!province.isOpen) {
        return 0;
    }
    return province.cities.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIColor *color;
    if (section % 2) {
        color = [UIColor colorWithRed:236.f/255 green:236.f/255 blue:236.f/255 alpha:1.0f];
    } else {
        color = [UIColor whiteColor];
    }
    Province *province = datas[section];
    UIImage *image = [UIImage imageNamed:province.isOpen ? @"bottom":@"top"];
    ;
    image = [image rt_tintedImageWithColor:[UIColor grayColor]];
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30.f) image:image text:province.ProvinceName];
    headerView.tag = section;
    headerView.backgroundColor = color;
    [headerView addTarget:self action:@selector(headerAction:) forControlEvents:UIControlEventTouchUpInside];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Province *provice = datas[indexPath.section];
    City *city = provice.cities[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = city.CityName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Province *provice = datas[indexPath.section];
    City *city = provice.cities[indexPath.row];
    NSLog(@"您选择：%@-%@",provice.ProvinceName,city.CityName);
}

- (void)headerAction:(HeaderView *)headerView
{
    Province *province = datas[headerView.tag];
    province.isOpen = !province.isOpen;
    UIImage *image = [UIImage imageNamed:province.isOpen ? @"bottom":@"top"];
    ;
    image = [image rt_tintedImageWithColor:[UIColor grayColor]];
    headerView.imageView.image = image;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:headerView.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
