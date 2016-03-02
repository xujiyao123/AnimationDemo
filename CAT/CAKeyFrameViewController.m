//
//  CAKeyFrameViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CAKeyFrameViewController.h"

@interface CAKeyFrameViewController ()
{
    CALayer * _layer;
}
@end

@implementation CAKeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * backGroundImage = [UIImage imageNamed:@"tree.jpg"];
    self.view.layer.contents = (id)backGroundImage.CGImage;
    
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"petal.png"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    
    
    [_layer addAnimation:groupAnimation(_layer , self , 2) forKey:nil];

}
///创建关键帧动画

CAKeyframeAnimation* translationAnimation(CALayer * layer) {
    
    CAKeyframeAnimation * kfa = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    NSValue * key1 = [NSValue valueWithCGPoint:_layer.position];
    //    NSValue * key2 = [NSValue valueWithCGPoint:CGPointMake(80, 220)];
    //    NSValue * key3 = [NSValue valueWithCGPoint:CGPointMake(45, 300)];
    //    NSValue * key4 = [NSValue valueWithCGPoint:CGPointMake(55, 400)];
    //    NSArray * keys = @[key1 , key2 , key3 , key4];
    //    kfa.values = keys;
    
    CGPoint endPoint =  CGPointMake(55, 400);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, layer.position.x, layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);
    kfa.path = path;
    CGPathRelease(path);
    
    [kfa setValue:[NSValue valueWithCGPoint:endPoint] forKey:@"TCKeyframeAnimationProperty_EndPosition"];
    return kfa;
}

CABasicAnimation* roationAimation() {
    
    NSNumber * toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    
    CABasicAnimation * caba = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    caba.toValue = toValue;
    caba.repeatCount = HUGE_VALF;
    caba.removedOnCompletion = NO;
    caba.autoreverses = YES;
   
    [caba setValue:toValue forKey:@"TCBasicAnimationProperty_ToValue"];
    return  caba;
}
///创建动画组
CAAnimationGroup *groupAnimation(CALayer * layer , id delegete , CFTimeInterval afterdely) {
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    
    CABasicAnimation * basicAnimation = roationAimation();
    CAKeyframeAnimation * keyFrameAnimation = translationAnimation(layer);
    
    animationGroup.animations = @[basicAnimation , keyFrameAnimation];
    animationGroup.delegate = delegete;
    animationGroup.duration = 10.0f;
//    animationGroup.repeatCount = HUGE_VALF;
//    animationGroup.removedOnCompletion = NO;
    animationGroup.beginTime = CACurrentMediaTime() + afterdely;
    
    return animationGroup;
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    CAAnimationGroup * animationGroup = (CAAnimationGroup *)anim;
    CABasicAnimation * cab = (CABasicAnimation *)animationGroup.animations[0];
    CAKeyframeAnimation * cakf = (CAKeyframeAnimation *)animationGroup.animations[1];
    
    CGFloat toValue = [[cab valueForKey:@"TCBasicAnimationProperty_ToValue"] floatValue];
    CGPoint endPoint = [[cakf valueForKey:@"TCKeyframeAnimationProperty_EndPosition"]CGPointValue];

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    _layer.position = endPoint;
    _layer.transform = CATransform3DMakeRotation(toValue, 0, 0, 1);
    [CATransaction commit];
    
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
