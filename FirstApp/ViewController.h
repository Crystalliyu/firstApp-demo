//
//  ViewController.h
//  FirstApp
//
//  Created by 李玉卿 on 5/30/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerDeleage.h"

@protocol ViewControllerDelegate <NSObject>

- (void)sendValue:(NSString *)value;

@end

@interface ViewController : UIViewController

@property (weak, nonatomic) id<ViewControllerDelegate> delegate;
//@property (nonatomic,strong) UILabel* Lbl;
@end

