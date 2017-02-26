//
//  SecondViewController.m
//  TableView界面传值
//
//  Created by 纵昂 on 2017/2/26.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property(nonatomic,retain)UILabel *label;
@property(nonatomic,retain)UITextField *textfield;
@property(nonatomic,retain)UIButton *button;

@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    
    self.label=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    self.label.backgroundColor=[UIColor redColor];
    self.label.layer.borderWidth=1;
    self.label.layer.cornerRadius=10;
    [self.view addSubview:self.label];
    //赋值
    self.label.text=self.name;
   
    
    self.textfield=[[UITextField alloc] initWithFrame:CGRectMake(100, 200, 150, 40)];
    self.textfield.layer.borderWidth=1;
    self.textfield.layer.cornerRadius=10;
    [self.view addSubview:self.textfield];
    
    
    
    self.button=[UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame=CGRectMake(200, 300, 150, 30);
    [self.button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.layer.borderWidth=1;
    self.button.layer.cornerRadius=5;
    [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)click:(UIButton *)button
{
    [self.delegate changeValue:self.textfield.text];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
