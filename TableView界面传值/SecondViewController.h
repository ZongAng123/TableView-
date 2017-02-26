//
//  SecondViewController.h
//  TableView界面传值
//
//  Created by 纵昂 on 2017/2/26.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

//协议方法
-(void)changeValue:(NSString *)value;

@end

@interface SecondViewController : UIViewController

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)id<SecondViewControllerDelegate>delegate;

@end
