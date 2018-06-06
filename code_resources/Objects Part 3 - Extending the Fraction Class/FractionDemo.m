#import "Fraction.h"
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Fraction *aFraction = [[Fraction alloc] init];
	Fraction *bFraction = [[Fraction alloc] init];
	
	[aFraction setNumerator:2 overDenominator:4];
	[bFraction setNumerator:1 overDenominator:3];
	
	[aFraction display]; NSLog(@" + "); [bFraction display]; NSLog(@" = ");	// Just to make a logical math statement
	[aFraction add:bFraction];
	// [aFraction reduce];
	[aFraction display];
	
	// Reset fractions
	[aFraction setNumerator:2 overDenominator:4];
	[bFraction setNumerator:1 overDenominator:3];
	
	NSLog(@"Using class method:");
	Fraction *classAddition = [Fraction addFraction:aFraction toFraction:bFraction];
	[classAddition display];
	
	[aFraction release];	
	[bFraction release];
    [pool drain];
    return 0;
}