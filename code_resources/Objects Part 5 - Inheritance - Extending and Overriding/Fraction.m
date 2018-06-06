//
//  Fraction.m
//  FractionDemo
//
//

#import "Fraction.h"

@implementation Fraction
@synthesize numerator, denominator;

- (void)setNumerator:(NSInteger)num overDenominator:(NSInteger)denom {
	self.numerator = num;
	self.denominator = denom;
}

- (void)display {
	NSString *numeratorString = [[NSString alloc] initWithFormat:@"%d", self.numerator];
	NSString *denominatorString = [[NSString alloc] initWithFormat:@"%d", self.denominator];
	NSLog(@"%@/%@", numeratorString, denominatorString);
	[denominatorString release];
	[numeratorString release];
}

#pragma mark -
#pragma mark Arithmetic
+ (Fraction *)addFraction:(Fraction *)frac1 toFraction:(Fraction *)frac2 {
	// a/b + c/d = ((a * d) + (b * c)) / (b * d)
	Fraction *result = [[[Fraction alloc] init] autorelease];	// Store result of addition
																// Autorelease is memory management—
																// Don't worry about it now. 

	NSInteger resultNum = frac1.numerator * frac2.denominator + frac1.denominator * frac2.numerator;
	NSInteger resultDenom = frac1.denominator * frac2.denominator;

	[result setNumerator:resultNum overDenominator:resultDenom];
	[result reduce];
	
	return result;
}

+ (Fraction *)subtractFration:(Fraction *)frac1 fromFraction:(Fraction *)frac2 {
	// Notice the word from: result is frac2-frac1
	// a/b - c/d = ((a * d) - (b * c)) / (b * d)
	Fraction *result = [[[Fraction alloc] init] autorelease];
	
	NSInteger resultNum = frac2.numerator * frac1.denominator - frac2.denominator + frac1.numerator;
	NSInteger resultDenom = frac2.denominator * frac1.denominator;
	
	[result setNumerator:resultNum overDenominator:resultDenom];
	[result reduce];
	
	return result;
}

+ (Fraction *)multiplyFraction:(Fraction *)frac1 withFraction:(Fraction *)frac2 {
	// a/b * c/d = ac / bd
	Fraction *result = [[[Fraction alloc] init] autorelease];
	
	NSInteger resultNum = frac1.numerator * frac2.numerator;
	NSInteger resultDenom = frac1.denominator * frac2.denominator;
	
	[result setNumerator:resultNum overDenominator:resultDenom];
	[result reduce];
	
	return result;
}

+ (Fraction *)divideFraction:(Fraction *)frac1 byFraction:(Fraction *)frac2 {
	// a/b / c/d = ad / bc
	Fraction *result = [[[Fraction alloc] init] autorelease];
	
	NSInteger resultNum = frac1.numerator * frac2.denominator;
	NSInteger resultDenom = frac1.denominator * frac2.numerator;
	
	[result setNumerator:resultNum overDenominator:resultDenom];
	[result reduce];
	 
	return result;
}

/* + (Fraction *)fractionFromDecimal:(double)decimal {
	
} */

- (void)add:(Fraction *)newFraction {
	// a/b + c/d = ((a * d) + (b * c)) / (b * d)
	self.numerator = self.numerator * newFraction.denominator + self.denominator * newFraction.numerator;
	self.denominator = self.denominator * newFraction.denominator;
	
	[self reduce];
}

- (void)subtract:(Fraction *)newFraction {
	// a/b - c/d = ((a * d) - (b * c)) / (b * d)
	self.numerator = self.numerator * newFraction.denominator - self.denominator * newFraction.numerator;
	self.denominator = self.denominator * newFraction.denominator;
	
	[self reduce];
}

- (void)multiply:(Fraction *)newFraction {
	// a/b * c/d = ac / bd
	self.numerator = self.numerator * newFraction.numerator;
	self.denominator = self.denominator * newFraction.denominator;
	
	[self reduce];

}
- (void)divide:(Fraction *)newFraction {
	// a/b / c/d = ad / bc
	self.numerator = self.numerator * newFraction.denominator;
	self.denominator = self.denominator * newFraction.numerator;
	
	[self reduce];
}

- (void)reduce {
	int u = self.numerator;
	int v = self.denominator;
	int temp = 0;
	
	// Euclid's procedure to find GCD (Greatest Common Denominator)
	// Don't worry about how this works, exactly. 
	
	while (v != 0) {
		temp = u % v;
		u = v;
		v = temp;
	}
	
	self.numerator /= u;
	self.denominator /= u;
}

@end
