//
//  CALayerViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CALayerViewController.h"
#import "TTView.h"

#define PHOTO_HEIGTH 150


@interface CALayerViewController ()
{
    CALayer * _layer;
}
@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    
    CALayer * layerShadow = [[CALayer alloc]init];
    layerShadow.bounds = CGRectMake(0, 0, PHOTO_HEIGTH, PHOTO_HEIGTH);
    layerShadow.position = CGPointMake(self.view.bounds.size.width/4, self.view.bounds.size.height/4);
    layerShadow.cornerRadius = PHOTO_HEIGTH/2;
    layerShadow.shadowColor = [UIColor grayColor].CGColor;
    layerShadow.shadowOffset = CGSizeMake(2, 1);
    layerShadow.shadowOpacity = 1;
    layerShadow.borderColor = [UIColor whiteColor].CGColor;
    layerShadow.borderWidth = 2;
    [self.view.layer addSublayer:layerShadow];
//
//    
//
     _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, PHOTO_HEIGTH, PHOTO_HEIGTH);
    _layer.position = CGPointMake(self.view.bounds.size.width/4, self.view.bounds.size.height/4);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.cornerRadius = PHOTO_HEIGTH/2;
    _layer.masksToBounds = YES;
    //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，
    //而阴影效果刚好在外边框
    //    layer.shadowColor=[UIColor grayColor].CGColor;
    //    layer.shadowOffset=CGSizeMake(2, 2);
    //    layer.shadowOpacity=1;
    _layer.borderColor = [UIColor whiteColor].CGColor;
    _layer.borderWidth = 2;
    
//    UIImage * image = [UIImage imageNamed:@"1.jpg"];
//    [layer setContents:(id)image.CGImage];
        _layer.delegate = self;
    [self.view.layer addSublayer:_layer];
//
    [_layer setNeedsDisplay];
//
    
    
    TTView * myview = [[TTView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/3, self.view.bounds.size.width, self.view.bounds.size.height/3)];
    myview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myview];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
//    CGContextSaveGState(ctx);
//    
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGTH);
    
    
    
    UIImage * cgImage = [UIImage imageNamed:@"11.jpg"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGTH, PHOTO_HEIGTH), cgImage.CGImage);
    [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
//    CGContextRestoreGState(ctx);
    
}
-(void)dealloc {
    
    _layer.delegate = nil;
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
