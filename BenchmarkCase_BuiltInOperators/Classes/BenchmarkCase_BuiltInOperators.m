#import "BenchmarkCase_BuiltInOperators.h"

@interface BenchmarkCase_BuiltInOperators ()

@end

@implementation BenchmarkCase_BuiltInOperators

+ (void)testShiftOperatorCalculate:(NSInteger)numbers
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

+ (void)testPlusOperatorCalculate:(NSInteger)numbers
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime decodeCostTime;

    for (NSInteger i = 0; i < numbers; i++) {
        NSInteger j = i + 2;
        i = j + 2;
    }

    decodeCostTime = (CFAbsoluteTimeGetCurrent() - startTime) * 1000;
    NSLog(@"[OPT] %ld plus operators calculate Cost: %fms", (long)numbers, decodeCostTime);
}

+ (void)testMultiplyOperatorCalculate:(NSInteger)numbers
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime decodeCostTime;

    for (NSInteger i = 0; i < numbers; i++) {
        NSInteger j = i * 2;
        i = j * 2;
    }

    decodeCostTime = (CFAbsoluteTimeGetCurrent() - startTime) * 1000;
    NSLog(@"[OPT] %ld multiply operators calculate Cost: %fms", (long)numbers, decodeCostTime);

}
@end
