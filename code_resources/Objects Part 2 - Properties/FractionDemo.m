#import "Fraction.h"
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Fraction *myFraction = [[Fraction alloc] init];
	
	// Set myFraction to value of 2/5
	/* [myFraction setNumerator: 2];
	[myFraction setDenominator: 5]; */
	myFraction.numerator = 2;
	myFraction.denominator = 5;
	
	// Display the value of myFraction
	NSLog(@"myFraction has a value of: ");
	[myFraction display];
	
	[myFraction release];	
    [pool drain];
    return 0;
}