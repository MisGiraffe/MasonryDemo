//
//  CalculatorDemo.h
//  MasonryDemo
//
//  Created by fangtingting on 2021/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorDemo : NSObject

@property (nonatomic, copy) CalculatorDemo* (^add)(NSInteger num);
@property (nonatomic, copy) CalculatorDemo* (^minus)(NSInteger num);
@property (nonatomic, copy) CalculatorDemo* (^multiply)(NSInteger num);
@property (nonatomic, copy) CalculatorDemo* (^divide)(NSInteger num);

@property (nonatomic, assign) NSInteger result;

- (CalculatorDemo * (^)(NSInteger num))add;
- (CalculatorDemo * (^)(NSInteger num))minus;
- (CalculatorDemo * (^)(NSInteger num))multiply;
- (CalculatorDemo * (^)(NSInteger num))divide;



@end

NS_ASSUME_NONNULL_END
