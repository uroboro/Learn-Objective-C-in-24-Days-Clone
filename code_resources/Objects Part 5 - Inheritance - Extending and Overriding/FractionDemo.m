#import "Fraction.h"
#import "MixedNumber.h"
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	/* ============================= FRACTION ============================= */
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
	// [bFraction release];
	
	/* ============================= MIXEDNUM ============================= */
	// bFraction is declared previously
	NSLog(@"MixedNumbers");
	MixedNumber *aMixedNum = [[MixedNumber alloc] init];
	MixedNumber *bMixedNum = [[MixedNumber alloc] init];
	[aMixedNum setWholeNumber:3 andNumerator:2 overDenominator:4];
	[bMixedNum setWholeNumber:4 andFraction:bFraction];
	
	NSLog(@"aMixedNum is"); [aMixedNum display];
	NSLog(@"After reducing, aMixedNum is"); [aMixedNum reduce]; [aMixedNum display];
	
	NSLog(@"Addition: ");	
	[aMixedNum display]; NSLog(@" + "); [bMixedNum display]; NSLog(@" = ");
	[[MixedNumber addMixedNumber:aMixedNum toMixedNumber:bMixedNum] display];	
	// display is invoked on the return value of the add method
	
	[bFraction release];
	[aMixedNum release];
	[bMixedNum release];
	
    [pool drain];
    return 0;
}