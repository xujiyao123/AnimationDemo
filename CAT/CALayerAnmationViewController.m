//
//  CALayerAnmationViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/1.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CALayerAnmationViewController.h"

@interface CALayerAnmationViewController ()

@end

@implementation CALayerAnmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.view.backgroundColor = [UIColor whiteColor];
        [self drawLayer];
}
- (void)drawLayer {

    CGSize size = [UIScreen mainScreen].bounds.size;
    
    CALayer * layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.position = CGPointMake(size.width/2, size.height/2);
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.cornerRadius = 50/2;
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = 0.9;
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@" , touches);
    UITouch * touch = [touches anyObject];
    
//    CALayer * layer = self.view.layer.sublayers[0];
//    CGFloat width = layer.bounds.size.width;
//    if (width == 50) {
//        width = 50 * 4;
//    }else {
//        width = 50;
//    }
//    layer.bounds=CGRectMake(0, 0, width, width);
//    layer.position=[touch locationInView:self.view];
//    layer.cornerRadius=width/2;
//    [self.view.layer addSublayer:layer];
    

    CALayer * layer = [[CALayer alloc]init];
    layer.backgroundColor = randomColor().CGColor;
    layer.position = [touch locationInView:self.view];
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.cornerRadius = 50/2;
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = 0.9;
    [self.view.layer addSublayer:layer];
    
}

//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch * touch = [touches anyObject];
//    
//    CALayer * layer = self.view.layer.sublayers[0];
//    CGFloat width = layer.bounds.size.width;
//    if (width == 50) {
//        width = 50 * 4;
//    }else {
//        width = 50;
//    }
//    layer.bounds=CGRectMake(0, 0, width, width);
//    layer.position=[touch locationInView:self.view];
//    layer.cornerRadius=width/2;
//    [self.view.layer addSublayer:layer];
//    
//    
//}


UIColor* randomColor(){
    
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
