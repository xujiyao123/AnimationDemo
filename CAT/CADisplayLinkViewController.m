//
//  CADisplayLinkViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CADisplayLinkViewController.h"

@interface CADisplayLinkViewController ()
{
    CALayer * _layer;
    int _index;
    NSMutableArray * _images;
}

@end

@implementation CADisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (id)[UIImage imageNamed:@"bg.png"].CGImage;
    
    _layer = [[CALayer alloc]init];
    _layer.bounds=CGRectMake(0, 0, 87, 32);
    _layer.position=CGPointMake(280, 50);
    [self.view.layer addSublayer:_layer];
    
    _images=[NSMutableArray array];
    for (int i=0; i<10; ++i) {
        NSString *imageName=[NSString stringWithFormat:@"fish%i.png",i];
        UIImage *image=[UIImage imageNamed:imageName];
        [_images addObject:image];
    }
    
    

    [self moveToTransation];
    // Do any additional setup after loading the view.
}
- (void)moveToTransation {
    
    CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(move)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    CAKeyframeAnimation * keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        NSValue * key1 = [NSValue valueWithCGPoint:_layer.position];
        NSValue * key2 = [NSValue valueWithCGPoint:CGPointMake(30, 70)];
        NSValue * key3 = [NSValue valueWithCGPoint:CGPointMake(280, 120)];
        NSValue * key4 = [NSValue valueWithCGPoint:CGPointMake(30, 170)];
          NSValue * key5 = [NSValue valueWithCGPoint:CGPointMake(280, 220)];
          NSValue * key6 = [NSValue valueWithCGPoint:CGPointMake(30, 270)];
          NSValue * key7 = [NSValue valueWithCGPoint:CGPointMake(280, 350)];
        NSArray * keys = @[key1 , key2 , key3 , key4 , key5 , key6 , key7];
  
    keyframeAnimation.duration = 10;
    keyframeAnimation.values = keys;
    keyframeAnimation.repeatCount = HUGE_VALF;
    keyframeAnimation.removedOnCompletion = NO;
   
    [_layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation"];
    
   
}
- (void)move {
    static int s=0;
    if (++s%10==0) {
        UIImage *image=_images[_index];
        _layer.contents=(id)image.CGImage;
        _index=(_index+1)%10;
    }
    
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
