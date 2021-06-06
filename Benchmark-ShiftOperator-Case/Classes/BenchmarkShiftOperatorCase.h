//
//  BenchmarkShiftOperatorCase.h
//  BenchmarkDemo-libWebp
//
//  Created by York on 2021/6/6.
//

#import <UIKit/UIKit.h>

@interface BenchmarkShiftOperatorCase : NSObject

/// 测试执行 numbers 次左移和右移计算的耗时
+ (void)testShiftOperatorsCalculate:(NSInteger)numbers;

@end

