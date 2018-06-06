//
//  Fraction.h
//  FractionDemo
//
//

#import <Cocoa/Cocoa.h>

@interface Fraction : NSObject {
	NSInteger numerator;
	NSInteger denominator;
}
@property NSInteger numerator;
@property NSInteger denominator;

- (void)setNumerator:(NSInteger)value;
- (void)setDenominator:(NSInteger)value;
- (void)display;

@end
