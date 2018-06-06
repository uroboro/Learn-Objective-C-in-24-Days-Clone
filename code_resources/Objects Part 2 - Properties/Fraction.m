//
//  Fraction.m
//  FractionDemo
//
//

#import "Fraction.h"

@implementation Fraction
@synthesize numerator, denominator

- (void)setNumerator:(NSInteger)value {
	numerator = value;
}

- (void)setDenominator:(NSInteger)value {
	denominator = value;
}

- (void)display {
	NSString *numeratorString = [[NSString alloc] initWithFormat:@"%d", self.numerator];
	NSString *denominatorString = [[NSString alloc] initWithFormat:@"%d", self.denominator];
	NSLog(@"%@/%@", numeratorString, denominatorString);
	[denominatorString release];
	[numeratorString release];
}

@end
