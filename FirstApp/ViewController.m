//
//  ViewController.m
//  FirstApp
//
//  Created by 李玉卿 on 5/30/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
   SecondViewController *sVC;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    sVC = [[SecondViewController alloc]init];
    self.title = @"生命周期方法调用顺序";
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    [self.navigationController pushViewController:sVC animated:YES];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sVC];
//    [self presentViewController:nav animated:YES completion:nil];

//    set the button for alert.
    UIBarButtonItem *Btn2 = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItem =Btn2;
    
    
//    set the observer.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFore) name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
    
//    set the button to next page.
    UIButton *Btn  = [[UIButton alloc]initWithFrame:CGRectMake(160, 600, 80, 50)];
    [Btn setTitle:@"NEXT" forState:UIControlStateNormal];
    Btn.backgroundColor = [UIColor lightGrayColor];
    [Btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn];
    

    
//    set the UIlabel
    UILabel *Lbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 200, 400, 200)];
    Lbl.numberOfLines = 10;
    Lbl.tag = 10;
    Lbl.text = @"ViewWillAppear\nViewDidAppear\nViewWillDisappear\nViewDidDisappear";
    Lbl.backgroundColor = [UIColor yellowColor];
    
//    设置行距
    NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing=10;
    NSDictionary*attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:20], NSParagraphStyleAttributeName:paragraphStyle};
    Lbl.attributedText=[[NSAttributedString alloc]initWithString:Lbl.text attributes:attributes];
    Lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:Lbl];
}

//show the notification.
-(void)enterFore{
    NSLog(@"Enter fore");
}

-(void)enterBackground{
    NSLog(@"Enter background");
}

//the action to next page.
-(void)next{
    self.delegate = sVC;
    sVC.title = @"The second page";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sVC];
    [self presentViewController:nav animated:YES completion:nil];
//    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UILabel *aLabel = [self.view viewWithTag:10];
    aLabel.text = @"1.viewWillAppear\n";
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UILabel *aLabel = [self.view viewWithTag:10];
    aLabel.text = [NSString stringWithFormat:@" %@ 2.viewDidAppear\n",aLabel.text];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UILabel *aLabel = [self.view viewWithTag:10];
    aLabel.text = [NSString stringWithFormat:@" %@ 3.viewWillDisappear\n",aLabel.text];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    UILabel *aLabel = [self.view viewWithTag:10];
    aLabel.text = [NSString stringWithFormat:@" %@ 4.viewDidDisappear\n",aLabel.text];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
