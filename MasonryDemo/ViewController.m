//
//  ViewController.m
//  MasonryDemo
//
//  Created by fangtingting on 2021/4/14.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "CalculatorDemo.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UILabel *textLable;
@property (nonatomic, strong) UIButton *animationBtn;
@property (nonatomic, strong) UIView *animaView;
@property (nonatomic, assign) int count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testDemo];
//    [self equalHeight];
    
//    [self VFLStudy];
    
   
    self.count = 0;
    [self animationDemo];
    
    CalculatorDemo *num = [[CalculatorDemo alloc] init];
    CalculatorDemo *res = num.add(10).minus(2);
    NSLog(@"result == %ld", (long)res.result);
}

- (void)animationDemo {
    self.animationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.animationBtn.backgroundColor = [UIColor redColor];
    
//    self.animationBtn.frame = CGRectMake(150, 160 , 100, 50);
    
    [self.animationBtn addTarget:self action:@selector(moveView) forControlEvents:UIControlEventTouchUpInside];
    
    self.animaView = [[UIView alloc] init];
    self.animaView.backgroundColor = [UIColor yellowColor];
    
    
    [self.view addSubview:self.animaView];
    [self.view addSubview:self.animationBtn];
    
    [self.animationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.top.equalTo(self.view).offset(160);
        make.left.equalTo(self.view).offset(150);
    }];
    
    [self.animaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 60));
//        make.center.equalTo(self.view);
        make.top.equalTo(self.view).offset(418);
        make.left.equalTo(self.view).offset(30);
    }];
    
    
    
}

- (void)moveView {
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    if (self.count%2==0) {
        [UIView animateWithDuration:5 animations:^{
            [self.animaView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(700);
//                make.right.equalTo(self.view).offset(-100);
            }];
            
            [self.view layoutIfNeeded];
            NSLog(@"self.animaView %@",self.animaView.description);
        }];
    }
    else {
        [UIView animateWithDuration:5 animations:^{
            [self.animaView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(400);
            }];
            
            [self.view layoutIfNeeded];
            NSLog(@"self.animaView %@",self.animaView.description);
        }];
        
    }
    self.count++;
    
}

- (void)testDemo {
    UIView *vi = [[UIView alloc] init];
    vi.backgroundColor = [UIColor redColor];

    self.yellowView = [[UIView alloc] init];
    self.yellowView.backgroundColor = [UIColor yellowColor];

    self.textLable = [[UILabel alloc] init];


    [self.view addSubview:vi];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.textLable];

    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.equalTo(self.view);
    }];

    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.left.equalTo(vi).with.offset(10);
//        make.top.equalTo(vi).with.offset(40);
//        make.right.equalTo(vi).with.offset(-10);
//        make.bottom.equalTo(vi).with.offset(-10);
        // 下、右不需要写负号，insets方法中已经为我们做了取反的操作了。
        make.edges.equalTo(vi).insets(UIEdgeInsetsMake(40, 10, 10, 10));
    }];

    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.lessThanOrEqualTo(@200);
        make.height.greaterThanOrEqualTo(@10);
    }];

    self.textLable.text = @"这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。这是测试的字符串。";

    self.textLable.numberOfLines = 0;
    
//    [self equalHeight];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenView];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
//        make.width.equalTo(self.view).priorityLow();
        make.width.mas_equalTo(20).priorityHigh();
        
        
        
        make.height.equalTo(self.view).priority(200);
        
        make.height.mas_equalTo(100).priority(300);
        
       
        
        
    }];
}

- (void)VFLStudy {
    UIView *redView = [[UIView alloc] init];
    UIView *blueView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    blueView.backgroundColor = [UIColor blueColor];
    
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:redView];
    [self.view addSubview:blueView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
    
    NSDictionary *spaceMetrics = @{@"space": @30,
                                   @"height" : @100};
    //水平
    NSString *hRedBlueVFL = \
    @"H:|-space-[blueView]-space-[redView(==blueView)]-space-|";
    
    NSArray *hLaoutConstraints = \
    [NSLayoutConstraint constraintsWithVisualFormat:hRedBlueVFL
                                            options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                            metrics:spaceMetrics
                                              views:views];
    
    [self.view addConstraints:hLaoutConstraints];
    
    //竖直
    NSString *vRedBlueVFL = @"V:[blueView(50)]-space-|";
    NSArray *vLayoutConstraints = \
    [NSLayoutConstraint constraintsWithVisualFormat:vRedBlueVFL
                                            options:kNilOptions
                                            metrics:spaceMetrics
                                              views:views];
    
    [self.view addConstraints:vLayoutConstraints];
    
    
    
}

- (void)equalHeight {
    CGFloat padding = 10;
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    /**********  等高   ***********/
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, 0, padding));
        make.bottom.equalTo(yellowView.mas_top).offset(-padding);
    }];
    
    /**
     下面设置make.height的数组是关键，通过这个数组可以设置这三个视图高度相等。其他例如宽度之类的，也是类似的方式。
     */
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, padding, padding));
        make.height.equalTo(@[blueView, redView]);
    }];
}

@end
