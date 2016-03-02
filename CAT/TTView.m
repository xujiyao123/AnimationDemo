//
//  TTView.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "TTView.h"
#import "TTLayer.h"

@implementation TTView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        TTLayer * layer = [[TTLayer alloc]init];
        layer.bounds = CGRectMake(0, 0, 185, 185);
        layer.position = CGPointMake(160, 284);
        layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
        [layer setNeedsDisplay];
        
        [self.layer addSublayer:layer];
        
   
    }
    
    return self;
    
}
-(void)drawRect:(CGRect)rect{
    NSLog(@"2-drawRect:");
    NSLog(@"CGContext:%@",UIGraphicsGetCurrentContext());//得到的当前图形上下文正是drawLayer中传递的
    [super drawRect:rect];
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"1-drawLayer:inContext:");
    NSLog(@"CGContext:%@",ctx);
    [super drawLayer:layer inContext:ctx];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
