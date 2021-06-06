//
//  BenchmarkShiftOperatorCase.m
//  BenchmarkDemo-libWebp
//
//  Created by York on 2021/6/6.
//

#import "BenchmarkShiftOperatorCase.h"

@interface BenchmarkShiftOperatorCase ()

@end

@implementation BenchmarkShiftOperatorCase

+ (void)testShiftOperatorsCalculate:(NSInteger)numbers
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime decodeCostTime;

    for (NSInteger i = 0; i < numbers; i++) {
        NSInteger j = i << 2;
        i = j >> 2;
    }

    decodeCostTime = (CFAbsoluteTimeGetCurrent() - startTime) * 1000;
    NSLog(@"[OPT] %ld shift operators calculate Cost: %fms", (long)numbers, decodeCostTime);
}

@end
