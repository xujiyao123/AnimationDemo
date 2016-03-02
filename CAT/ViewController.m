//
//  ViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "ViewController.h"
#import "CALayerAnmationViewController.h"
#import "CALayerViewController.h"
#import "CABaseAnmationViewController.h"
#import "CAKeyFrameViewController.h"
#import "CATransitionViewController.h"
#import "CADisplayLinkViewController.h"
#import "UIViewAnmationViewController.h"

@interface ViewController ()<UITableViewDataSource , UITableViewDelegate>
{
    UITableView * _tableView;

    
    NSArray * _key;
    NSArray * _value;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Animation Demo";
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
;
    
 
    
    _key  = @[@"CALayer基本",@"CALayer隐式动画", @"CAB基本动画",@"CAKF关键帧动画", @"CAT转场动画",@"CAD逐帧动画",@"UIView动画"];
    _value = @[@"CALayerViewController",@"CALayerAnmationViewController",@"CABaseAnmationViewController",@"CAKeyFrameViewController", @"CATransitionViewController",@"CADisplayLinkViewController", @"UIViewAnmationViewController"];
    
    // Do any additional stup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _key.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = _key[indexPath.row];
    cell.detailTextLabel.text = _value[indexPath.row];
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
 
    
    UIViewController * vc = [[NSClassFromString(_value[indexPath.row]) alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
