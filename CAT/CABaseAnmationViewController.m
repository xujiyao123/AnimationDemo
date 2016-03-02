//
//  CABaseAnmationViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CABaseAnmationViewController.h"

@interface CABaseAnmationViewController ()
{
    CALayer * _layer;
}

@end

@implementation CABaseAnmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 88, 88)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"11.jpg"];
    [self.view addSubview:imageView];
    
    
    [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        self.view.backgroundColor = [UIColor blackColor];
        imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
        imageView.center = self.view.center;
        
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        [self makeTreeAnn];
    }];
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}
- (void)makeTreeAnn {
    
    UIImage * backGroundImage = [UIImage imageNamed:@"tree.jpg"];
    self.view.layer.contents = (id)backGroundImage.CGImage;
    
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.anchorPoint = CGPointMake(0.5, 0.6);
    _layer.contents = (id)[UIImage imageNamed:@"petal.png"].CGImage;
    [self.view.layer addSublayer:_layer];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
    UITouch * touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    
    CAAnimation * animation = [_layer animationForKey:@"TCABANN_TREE"];
    if (animation) {
        if (_layer.speed == 0) {
            [self animationResume];
        }else {
            [self animationPause];
        }
    }else {
        
        [self translationAnimation:location];
        [self rotationAnimation];
    }
    
    
}
-(void)translationAnimation:(CGPoint)location {
    
    CABasicAnimation * caba = [CABasicAnimation animationWithKeyPath:@"position"];
    
    caba.toValue = [NSValue valueWithCGPoint:location];
    caba.duration = 5.0;
//    caba.repeatCount=HUGE_VALF;//设置重复次数,HUGE_VALF可看做无穷大，起到循环动画的效果
    
    
    caba.delegate = self;
    [caba setValue:[NSValue valueWithCGPoint:location] forKey:@"TREE_LOCATION"];
    [_layer addAnimation:caba forKey:@"TCABANN_TREE"];
    
}
- (void)rotationAnimation {
    
    CABasicAnimation * caba = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    caba.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    caba.repeatCount = HUGE_VALF;
    caba.removedOnCompletion = NO;
    caba.duration = 6.0;
    caba.autoreverses = YES;
    [_layer addAnimation:caba forKey:@"TREE_ROTATION"];
}
-(void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animation(%@) start.\r_layer.frame=%@",anim,NSStringFromCGRect(_layer.frame));
    NSLog(@"%@",[_layer animationForKey:@"TCABANN_TREE"]);//通过前面的设置的key获得动画
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animation(%@) stop.\r_layer.frame=%@",anim,NSStringFromCGRect(_layer.frame));
    
    ///关闭隐式动画
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    
    _layer.position=[[anim valueForKey:@"TREE_LOCATION"] CGPointValue];
    
    
    [CATransaction commit];
    [self animationPause];
}
- (void)animationPause {
    
    CFTimeInterval interval = [ _layer convertTime:CACurrentMediaTime() fromLayer:nil];
    [_layer setTimeOffset:interval];
    _layer.speed = 0;
    
}
- (void)animationResume {
    CFTimeInterval beginTime = CACurrentMediaTime() - _layer.timeOffset;
    _layer.timeOffset = 0;
    _layer.beginTime = beginTime;
    _layer.speed = 1.0;
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
