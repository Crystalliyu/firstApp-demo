//
//  SecondViewController.m
//  FirstApp
//
//  Created by 李玉卿 on 5/30/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondViewController.h"
#import "ViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *Btn  = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 80, 50)];
    [Btn setTitle:@"上一页" forState:UIControlStateNormal];
    Btn.backgroundColor = [UIColor lightGrayColor];
    [Btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(alert)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Return" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItem = backBtn;
}

-(void)next{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


-(void)alert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"已经是最后一页啦" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
    }];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
