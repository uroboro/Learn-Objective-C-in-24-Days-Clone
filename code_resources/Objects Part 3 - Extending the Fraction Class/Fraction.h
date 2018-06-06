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

- (void)setNumerator:(NSInteger)num overDenominator:(NSInteger)denom;
- (void)display;

#pragma mark -	
#pragma mark Arithmetic
// The lines above are for Xcode to interpret.
// If you click on the function bar right below the file browser,
// Next to the little icons above the editor, 
// You'll see a neatly listed bold entry. 
+ (Fraction *)addFraction:(Fraction *)frac1 toFraction:(Fraction *)frac2;
+ (Fraction *)subtractFration:(Fraction *)frac1 fromFraction:(Fraction *)frac2;
+ (Fraction *)multiplyFraction:(Fraction *)frac1 withFraction:(Fraction *)frac2;
+ (Fraction *)divideFraction:(Fraction *)frac1 byFraction:(Fraction *)frac2;
// + (Fraction *)fractionFromDecimal:(double)decimal;

- (void)add:(Fraction *)newFraction;
- (void)subtract:(Fraction *)newFraction;
- (void)multiply:(Fraction *)newFraction;
- (void)divide:(Fraction *)newFraction;
- (void)reduce;
@end
