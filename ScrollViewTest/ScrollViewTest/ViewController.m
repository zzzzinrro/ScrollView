//
//  ViewController.m
//  ScrollViewTest
//
//  Created by zinrro on 2017/6/20.
//  Copyright © 2017年 gujianchao. All rights reserved.
//

#import "ViewController.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, strong) UIView *myView;
@end

@implementation ViewController

- (UIScrollView *)myScrollView {
    if (_myScrollView == nil) {
        _myScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _myScrollView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight*2);
        _myScrollView.delegate = self;
    }
    return _myScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myScrollView];
    
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    myView.backgroundColor = [UIColor yellowColor];
    myView.alpha = 0;
    [self.view addSubview:myView];
    self.myView = myView;
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, KScreenWidth, 250)];
    myImageView.image = [UIImage imageNamed:@"bear"];
    myImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:myImageView];
    self.myImageView = myImageView;
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, KScreenWidth, 50)];
    myLabel.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:myLabel];
    self.myLabel = myLabel;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat alpha = scrollView.contentOffset.y / 186;
    self.myView.alpha = alpha;
    
    CGFloat scale = 1 - (scrollView.contentOffset.y / 186);
    scale = (scale >= 1) ? scale : 1;
    scale = (scale <= 2) ? scale : 2;
    self.myImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    if (scrollView.contentOffset.y >= 186)
    {
        CGRect rect = self.myLabel.frame;
        rect.origin.y = 64;
        self.myLabel.frame = rect;
        [self.view addSubview:self.myLabel];
    }
    else
    {
        CGRect rect = self.myLabel.frame;
        rect.origin.y = 250;
        self.myLabel.frame = rect;
        [scrollView addSubview:self.myLabel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
