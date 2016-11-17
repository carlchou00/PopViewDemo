//
//  ViewController.m
//  PopView
//
//  Created by 邢汉杰 on 2016/11/16.
//  Copyright © 2016年 邢汉杰. All rights reserved.
//

#import "ViewController.h"
#import "bayeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController pushViewController:[bayeViewController new] animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
