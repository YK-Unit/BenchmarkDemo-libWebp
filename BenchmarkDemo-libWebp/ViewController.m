//
//  ViewController.m
//  BenchmarkDemo-libWebp
//
//  Created by York on 2021/6/6.
//

#import "ViewController.h"
#import "YYImageCoder.h"
#import "UIImage+YYForceDecode.h"
#import "BenchmarkCase_BuiltInOperators.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<NSString *> *webpImageNameArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webpImageNameArray = @[
        @"test_1",
//        @"test_2",
//        @"test_3",
//        @"test_4",
//        @"test_5",
//        @"test_6",
    ];
}

- (IBAction)decodeWebpImages:(id)sender
{
    NSLog(@"=== webp 解码耗时 ===");
    for (NSString *imageName in self.webpImageNameArray) {
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"webp"];
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];

        CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
        
        YYImageDecoder *decoder = [YYImageDecoder decoderWithData:imageData scale:1.0];
        YYImageFrame *frame = [decoder frameAtIndex:0 decodeForDisplay:NO];
        UIImage *image = [UIImage yy_decodedImageWithImage:frame.image];
        NSAssert(image != nil, @"find invalid diskImage: %@", imageName);

        CFAbsoluteTime decodeCostTime = (CFAbsoluteTimeGetCurrent() - startTime) * 1000;
        NSLog(@"[OPT] diskImage(%@) decode cost: %fms", imageName, decodeCostTime);
    }
}

- (IBAction)doNumberOfShiftOperatorsCalculate:(id)sender
{
    NSLog(@"=== 大量左右位移计算耗时（10w次） ===");
    NSInteger numbers = 100000;
    [BenchmarkCase_BuiltInOperators testShiftOperatorCalculate: numbers];

    [BenchmarkCase_BuiltInOperators testPlusOperatorCalculate: numbers];

    [BenchmarkCase_BuiltInOperators testMultiplyOperatorCalculate: numbers];
}

- (IBAction)doLittleOfShiftOperatorsCalculate:(id)sender
{
    NSLog(@"=== 小量左右位移计算耗时（100次） ===");
    NSInteger numbers = 100;
    
    [BenchmarkCase_BuiltInOperators testShiftOperatorCalculate: numbers];

    [BenchmarkCase_BuiltInOperators testPlusOperatorCalculate: numbers];

    [BenchmarkCase_BuiltInOperators testMultiplyOperatorCalculate: numbers];
}

@end
