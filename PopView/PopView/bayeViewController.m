//
//  bayeViewController.m
//  test
//
//  Created by 邢汉杰 on 2016/11/16.
//  Copyright © 2016年 邢汉杰. All rights reserved.
//

#import "bayeViewController.h"
#import "KGDislikeView.h"

@interface bayeViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation bayeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(250, 70, 50, 30)];
//    button.backgroundColor = [UIColor orangeColor];
//    [button addTarget:self action:@selector(abc:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = @"123";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [KGDislikeView showFromView:cell itemTitles:@[@"123", @"123", @"123", @"123", @"123", @"123", @"123"]];
}

- (void)abc:(UIButton *)button {
    [KGDislikeView showFromView:button itemTitles:@[@"123", @"123", @"123", @"123", @"123", @"123", @"123"]];
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
