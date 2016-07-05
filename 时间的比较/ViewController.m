//
//  ViewController.m
//  时间的比较
//
//  Created by myh on 16/6/8.
//  Copyright © 2016年 myh. All rights reserved.
//
#import "NSDate+MYHExtension.h"
#import "ViewController.h"
#import "Person.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{

    UITableView *_tableView;
    

}
@property(nonatomic,strong)NSMutableArray *dataSource; ;
@end

@implementation ViewController

#pragma mark Getting && 懒加载
- (NSMutableArray *)dataSource{
    
    if (_dataSource ==nil) {
        
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"person.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        _dataSource = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            Person *p = [[Person alloc]initWithDict:dic];
          [self.dataSource addObject:p];
        }
    }
    
    return _dataSource;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


-(void)setupUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
#warning 此处我就不封装了
    cell.textLabel.numberOfLines = 0;
    Person *p  = self.dataSource[indexPath.row];
    cell.textLabel.text = p.name;
    cell.imageView.image  = [UIImage imageNamed:p.icon];
    cell.detailTextLabel.text = p.time;
    //时间处理
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //设置时间格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //从服务器拿到返回的时间
    NSDate *creatDate = [fmt dateFromString:p.time];
    if (creatDate.isThisYear) {//今年
        if (creatDate.isToday) {//今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:creatDate];
            if (cmps.hour >=1) {//时间差距>=1小时
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }else if (cmps.minute >=1){//时间差距大于1分钟
            
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }else{//表示时间差距小于一分钟
            
            cell.detailTextLabel.text = @"刚刚";
            }
        }else if (creatDate.isYesterday) {//时间差距是昨天
        
        fmt.dateFormat = @"昨天 HH:mm:ss";
        
            cell.detailTextLabel.text = [fmt stringFromDate:creatDate];
        }else if (creatDate.isTwoYesterday) {//时间差距是昨天
            
            fmt.dateFormat = @"前天 HH:mm:ss";
            
            cell.detailTextLabel.text = [fmt stringFromDate:creatDate];
        }
        
        else{
            /**
             *  表示时间差距大于昨天
             */
        fmt.dateFormat = @"MM-dd HH:mm:ss";
            cell.detailTextLabel.text = [fmt stringFromDate:creatDate];
        
        }
    }
    
    
    return cell;
}
@end
