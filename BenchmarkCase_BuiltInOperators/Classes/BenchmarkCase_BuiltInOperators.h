#import <UIKit/UIKit.h>

@interface BenchmarkCase_BuiltInOperators : NSObject

/// 测试执行 numbers 次位移计算（左移和右移）的耗时
+ (void)testShiftOperatorCalculate:(NSInteger)numbers;

/// 测试执行 numbers 次加法算术计算的耗时
+ (void)testPlusOperatorCalculate:(NSInteger)numbers;

/// 测试执行 numbers 次乘法算术计算的耗时
+ (void)testMultiplyOperatorCalculate:(NSInteger)numbers;

@end

