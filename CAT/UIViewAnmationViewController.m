//
//  UIViewAnmationViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "UIViewAnmationViewController.h"

@interface UIViewAnmationViewController ()
{
    UIImageView * _imageView;
}
@end

@implementation UIViewAnmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 260)];
    _imageView.image = [UIImage imageNamed:@"0.jpg"];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    _imageView.userInteractionEnabled = YES;
    _imageView.center = self.view.center;
    [self.view addSubview:_imageView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_imageView addGestureRecognizer:tap];

    // Do any additional setup after loading the view.
}
- (void)tap:(UITapGestureRecognizer *)tap {
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
        _imageView.frame = [UIScreen mainScreen].bounds;
        _imageView.center = self.view.center;
    } completion:^(BOOL finished) {
        _imageView.frame = CGRectMake(0, 0, 150 , 260 );
        _imageView.center = self.view.center;
    }];
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
