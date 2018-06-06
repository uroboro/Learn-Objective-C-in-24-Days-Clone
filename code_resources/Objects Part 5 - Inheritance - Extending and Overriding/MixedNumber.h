//
//  MixedNumber.h
//  FractionDemo
//

#import <Cocoa/Cocoa.h>
#import "Fraction.h"

@interface MixedNumber : Fraction {
	NSInteger wholeNumber;
}
@property (nonatomic) NSInteger wholeNumber;

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num overDenominator:(NSInteger)denom;
- (void)setWholeNumber:(NSInteger)number andFraction:(Fraction *)frac;
- (void)display;

- (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2;
@end
