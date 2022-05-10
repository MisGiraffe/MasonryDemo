//
//  CalculatorDemo.m
//  MasonryDemo
//
//  Created by fangtingting on 2021/4/20.
//

#import "CalculatorDemo.h"

@implementation CalculatorDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.result = 0;
    }
    return self;
}


- (CalculatorDemo * _Nonnull (^)(NSInteger))add {
    return ^id(NSInteger num) {
        self.result += num;
        return self;
    };
}

- (CalculatorDemo * _Nonnull (^)(NSInteger))minus {
    return ^id(NSInteger num) {
        self.result -= num;
        return self;
    };
}

- (CalculatorDemo * _Nonnull (^)(NSInteger))multiply {
    return ^id(NSInteger num) {
        self.result *= num;
        return self;
    };
}

- (CalculatorDemo * _Nonnull (^)(NSInteger))divide {
    return ^id(NSInteger num) {
        self.result /= num;
        return self;
    };
}
@end
