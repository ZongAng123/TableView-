//
//  MainViewController.m
//  TableView界面传值
//
//  Created by 纵昂 on 2017/2/26.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,SecondViewControllerDelegate>
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)UIImageView *imageView;
@end

@implementation MainViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self =[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arr = [NSMutableArray arrayWithObjects:@"宋江", @"卢俊义", @"吴用", @"公孙胜", @"关胜", @"林冲", @"秦明" ,@"呼延灼" , @"花容",@"柴进", @"李应", @"朱仝",@"鲁智深",@"武松",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent=NO;
    self.navigationItem.title=@"表视图";
    
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight=50;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"h1.jpeg"]];
    self.imageView.frame=CGRectMake(0, -200, self.view.frame.size.width, 200);
//   给tableview添加头视图
//   宽是tableview的宽度
//   self.tableView.tableHeaderView=self.imageView;
    [self.tableView addSubview:self.imageView];
    
    self.tableView.contentInset=UIEdgeInsetsMake(200, 0, 0, 0);
    
}

#pragma mark tableview的delegate已经签订好scrollerView的协议,只要设置代理人,就可以使用scrollerview的协议方法
//只要滑动就会触发
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //获取偏移量
    CGFloat y=scrollView.contentOffset.y;
    NSLog(@"%g",y);
    if (y<0) {
        self.imageView.frame=CGRectMake(0, y, self.view.frame.size.width, -y);
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse=@"reuse";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    cell.textLabel.text=self.arr[indexPath.row];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%ld",indexPath.section];
    cell.imageView.image=[UIImage imageNamed:@"天平.png"];
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"水浒";
}



- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.arr;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *secVC=[[SecondViewController alloc] init];
    secVC.name= self.arr[indexPath.row];
    [self.navigationController pushViewController:secVC animated:YES];
    secVC.delegate=self;

}

-(void)changeValue:(NSString *)value
{
    //属性的数组,相当于数据源,把传过来的值添加到数组中
    [self.arr addObject:value];
    //对数据进行刷新
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
