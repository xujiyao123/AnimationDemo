//
//  CATransitionViewController.m
//  CAT
//
//  Created by 徐继垚 on 16/3/2.
//  Copyright © 2016年 Sunny土. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
{
    UIImageView * _imageView;
    int _currentIndex;
}

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView=[[UIImageView alloc]init];
    _imageView.frame=[UIScreen mainScreen].bounds;
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    _imageView.image=[UIImage imageNamed:@"0.jpg"];
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)leftSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:YES];
}

-(void)rightSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:NO];
}

-(void)transitionAnimation:(BOOL) isNext  {
    
    CATransition * transition = [[CATransition alloc]init];
    
    transition.type = [self randomType];
    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    }else {
        transition.subtype = kCATransitionFromLeft;
    }
    transition.duration = 1.0f;
    
    _imageView.image =  [self getImage:isNext];
    
    [_imageView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
    
}
- (NSString *)randomType {
    
    NSArray * types = @[@"cube" , @"oglFlip" , @"pageCurl" , @"pageUnCurl" , kCATransitionFade , kCATransitionMoveIn , kCATransitionPush , kCATransitionReveal];
    
    int random = arc4random()% types.count;
    
    return  types[random];
    
}
- (UIImage * )getImage:(BOOL)isNext{
    
    if (isNext) {
        _currentIndex = (_currentIndex + 1)%5;
    }else {
        _currentIndex = (_currentIndex - 1 + 5)%5;
    }
    NSString * imageName = [NSString stringWithFormat:@"%i.jpg" , _currentIndex];
    return [UIImage imageNamed:imageName];
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
