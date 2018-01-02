//
//  ViewController.m
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+ErrorHandle.h"
#import "NextVC.h"
#import "NSMutableArray+ErrorHandle.h"

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *type = nil;
    self.array = [NSArray arrayWithObjects:@"语文", @"数学", @"英语", nil];
    [self.dataSource addObjectVerify:type];
    [self.dataSource addObjectVerify:@"语文"];
    [self.dataSource addObjectVerify:@"数学"];
    [self.dataSource addObjectVerify:@"英语"];
    [self.dataSource insertObjectVerify:type atIndex:10];
    [self.dataSource insertObjectVerify:@"物理" atIndex:2];
    
    [self.view addSubview:self.tableView];
}
/**
 *  dataSource
 */
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
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
    return self.dataSource.count+5;
}
#pragma mark - cellForRowAtIndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        if (indexPath.row < self.dataSource.count) {
            UITextField *textFiled = [[UITextField alloc] init];
            textFiled.frame = CGRectMake(70, 0, kScreenWidth-70, 50);
            textFiled.placeholder = @"此处是NSMutableArray的数组越界处理";
            [cell addSubview:textFiled];
        }else{
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, kScreenWidth-30, 50)];
            label.textColor = [UIColor blackColor];
            label.text = @"点击此处去查看NSArray的数组越界处理";
            [cell addSubview:label];
        }
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    //cell.textLabel.text = self.dataSource[indexPath.row];
    //cell.textLabel.text = [self.dataSource objectAtIndexVerify:indexPath.row];
    //cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextVC *tempVC = [[NextVC alloc] init];
    
    [self presentViewController:tempVC animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
