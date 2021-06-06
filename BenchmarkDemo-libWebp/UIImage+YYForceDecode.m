//
//  UIImage+YYForceDecode.m
//  BenchmarkDemo-libWebp
//
//  Created by York on 2021/6/6.
//

#import "UIImage+YYForceDecode.h"

@implementation UIImage (YYForceDecode)

+ (UIImage *)yy_decodedImageWithImage:(UIImage *)image
{
    if (image.images) {
        return image;
    }
    @autoreleasepool {
        CGImageRef imageRef = image.CGImage;
        CGSize imageSize = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
        CGRect imageRect = (CGRect) {.origin = CGPointZero, .size = imageSize};

        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);

        int infoMask = (bitmapInfo & kCGBitmapAlphaInfoMask);
        BOOL anyNonAlpha = (infoMask == kCGImageAlphaNone || infoMask == kCGImageAlphaNoneSkipFirst || infoMask == kCGImageAlphaNoneSkipLast);

        if (infoMask == kCGImageAlphaNone && CGColorSpaceGetNumberOfComponents(colorSpace) > 1) {
            bitmapInfo &= ~kCGBitmapAlphaInfoMask;

            bitmapInfo |= kCGImageAlphaNoneSkipFirst;
        }
        else if (!anyNonAlpha && CGColorSpaceGetNumberOfComponents(colorSpace) == 3) {
            bitmapInfo &= ~kCGBitmapAlphaInfoMask;
            bitmapInfo |= kCGImageAlphaPremultipliedFirst;
        }

        CGContextRef context = CGBitmapContextCreate(NULL, imageSize.width, imageSize.height, CGImageGetBitsPerComponent(imageRef), 0, colorSpace, bitmapInfo);
        CGColorSpaceRelease(colorSpace);

        if (!context) {
             return image;
        }

        CGContextDrawImage(context, imageRect, imageRef);
        CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);

        CGContextRelease(context);

        UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef scale:image.scale orientation:image.imageOrientation];
        CGImageRelease(decompressedImageRef);
        return decompressedImage;
    }
}

@end
