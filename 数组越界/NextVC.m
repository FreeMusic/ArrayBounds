//
//  NextVC.m
//  数组越界
//
//  Created by mic on 2017/12/26.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSArray+ErrorHandle.h"
#import "NextVC.h"
#import "NSMutableArray+ErrorHandle.h"

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface NextVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation NextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSArray arrayWithObjects:@"语文", @"数学", @"英语", nil];
    [self.view addSubview:self.tableView];
}
/**
 *tableView的懒加载
 */
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
#pragma mark - cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        if (indexPath.row < self.dataSource.count) {
            UITextField *textFiled = [[UITextField alloc] init];
            textFiled.frame = CGRectMake(100, 0, kScreenWidth-100, 50);
            textFiled.placeholder = @"此处是NSArray的数组越界处理";
            [cell addSubview:textFiled];
        }else{
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
            label.textColor = [UIColor blackColor];
            label.text = @"点击此处去查看NSMutableArray的数组越界处理";
            [cell addSubview:label];
        }
    }
    cell.textLabel.text = [self.dataSource objectAtIndexVerify:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
