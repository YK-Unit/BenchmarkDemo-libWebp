//
//  UIImage+YYForceDecode.h
//  BenchmarkDemo-libWebp
//
//  Created by York on 2021/6/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YYForceDecode)

+ (UIImage *)yy_decodedImageWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
