//
//  HMBasicAnimation.m
//  HMSideDrawerDirectionalExample
//
//  Created by Hello Mihai on 9/2/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import "HMBasicAnimation.h"
#import "HMGrandCentralDispatch.h"

@implementation HMBasicAnimation

+ (void)animate:(CALayer*)layer
         toValue:(id)toValue
        duration:(CGFloat)duration
    delaySeconds:(CGFloat)delaySeconds
         keyPath:(NSString*)keyPath
{
    // on delay set the value to the model (animating presentation layer wont update model)
    [HMGrandCentralDispatch delayCallbackOnMainQueueWithDelay:delaySeconds block:^{
        id currentValue = [layer valueForKeyPath:keyPath];
        CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:keyPath];
        animation.fromValue = currentValue;
        animation.toValue = toValue;
        animation.duration = duration;
        [layer addAnimation:animation forKey:keyPath]; // start animation
        [layer setValue:toValue forKeyPath:keyPath];
    }];
}

+ (void)rotate2D:(CALayer*)layer
    toDegreeAngle:(float)toDegreeAngle
         duration:(CGFloat)duration
     delaySeconds:(CGFloat)delaySeconds
{
    float radian = [self degreeToRadian:toDegreeAngle];
    [self animate:layer toValue:@(radian) duration:duration delaySeconds:delaySeconds keyPath:HMBasicAnimation_ROTATION];
}

+ (void)rotate3D:(CALayer*)layer
    toDegreeAngle:(float)toDegreeAngle
         duration:(CGFloat)duration
     delaySeconds:(CGFloat)delaySeconds
          keyPath:(NSString*)keyPath
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / 500.0;
    layer.transform = transform;

    float radian = [self degreeToRadian:toDegreeAngle];
    [self animate:layer toValue:@(radian) duration:duration delaySeconds:delaySeconds keyPath:keyPath];
}

#pragma mark : helpers

+ (float)degreeToRadian:(float)degrees
{
    return degrees * M_PI / 180;
}

@end
