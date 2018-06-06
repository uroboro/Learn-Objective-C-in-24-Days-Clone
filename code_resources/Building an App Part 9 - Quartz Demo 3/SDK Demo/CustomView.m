//
//  CustomView.m
//  SDK Demo
//
//  Created by Feifan on 5/27/12.
//
//

#import "CustomView.h"

@implementation CustomView
@synthesize mode;

- (id)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
		return nil;
	self.backgroundColor = [UIColor lightGrayColor];
	return self;
}

#pragma mark - Drawing Methods
- (NSArray *)pointsForPolygonWithSides:(NSInteger)numberOfSides inRect:(CGRect)rect {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.9 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	// float exteriorAngle = M_PI - ((2.0 * M_PI) / numberOfSides);
	float rotationDelta = angle - (0.5 * (M_PI - ((2.0 * M_PI) / numberOfSides)));
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
		float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX + rect.origin.x, center.y + curY + rect.origin.y)]];
	}
	return result;
}

- (void)drawStraightLinesInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 35, 10);
	CGContextAddLineToPoint(context, 45, 65);
	[[UIColor blueColor] setStroke];
	CGContextSetLineWidth(context, 5.0);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextStrokePath(context);
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 250, 35);
	CGContextAddLineToPoint(context, 85, 130);
	[[UIColor redColor] setStroke];
	CGContextSetLineWidth(context, 2.0);
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextStrokePath(context);
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 55, 120);
	CGContextAddLineToPoint(context, 65, 220);
	[[UIColor greenColor] setStroke];
	CGContextSetLineWidth(context, 3.0);
	float lengths[] = {2.0, 6.0};
	CGContextSetLineDash(context, 0, lengths, 2);
	CGContextStrokePath(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 105, 150);
	CGContextAddLineToPoint(context, 65, 290);
	[[UIColor blackColor] setStroke];
	CGContextSetLineWidth(context, 3.0);
	float lengths2[] = {7.5, 4.5, 1.0};
	CGContextSetLineDash(context, 3, lengths2, 3);
	CGContextStrokePath(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 180, 120);
	CGContextAddLineToPoint(context, 260, 340);
	[[UIColor orangeColor] setStroke];
	CGContextSetLineWidth(context, 2.0);
	float lengths3[] = {5.0, 3.0, 4.0, 2.0, 3.0, 5.0, 2.0, 4.0, 1.0, 8.0, 1.0, 2.0, 1.0, 3.0, 1.0, 4.0, 1.0, 5.0};
	CGContextSetLineDash(context, 2, lengths3, 18);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawCurvesInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 25, 50);
	CGContextAddLineToPoint(context, 120, 25);
	CGContextAddArc(context, 120, 120, 40, 0.25*M_PI, 1.5*M_PI, 0);
	[[UIColor redColor] setStroke];
	CGContextStrokePath(context);
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 150, 100);
	CGContextAddQuadCurveToPoint(context, 250, 20, 300, 100);
	[[UIColor purpleColor] setStroke];
	CGContextStrokePath(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 180, 220);
	CGContextAddQuadCurveToPoint(context, 300, 0, 310, 180);
	[[UIColor magentaColor] setStroke];
	CGContextStrokePath(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 10, 260);
	CGContextAddCurveToPoint(context, 100, 160, 210, 360, 300, 290);
	[[UIColor greenColor] setStroke];
	CGContextStrokePath(context);
	// Draw control path for cubic curve
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 10, 260);
	CGContextAddLineToPoint(context, 100, 160);
	CGContextAddLineToPoint(context, 210, 360);
	CGContextAddLineToPoint(context, 300, 290);
	[[UIColor darkGrayColor] setStroke];
	CGContextSetLineWidth(context, 0.5);
	float lengths[] = {2.0, 1.0};
	CGContextSetLineDash(context, 0, lengths, 2);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawCustomShapesInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 75, 10);
	CGContextAddLineToPoint(context, 160, 150);
	CGContextAddLineToPoint(context, 10, 150);
	CGContextClosePath(context);
	[[UIColor redColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextSetLineWidth(context, 5.0);
	CGContextSetLineJoin(context, kCGLineJoinRound);
	CGContextDrawPath(context, kCGPathFillStroke);
	
	// Draw rectangle
	CGContextBeginPath(context);
	CGContextAddRect(context, CGRectMake(200, 45, 100, 63));
	[[UIColor yellowColor] setFill];
	[[UIColor greenColor] setStroke];
	CGContextSetLineWidth(context, 3.0);
	CGContextDrawPath(context, kCGPathFillStroke);
	
	// Stroke Ellipse
	CGContextBeginPath(context);
	CGContextAddEllipseInRect(context, CGRectMake(35, 200, 180, 120));
	[[UIColor blueColor] setStroke];
	CGContextDrawPath(context, kCGPathStroke);
	
	// Fill Circle
	CGContextBeginPath(context);
	CGContextAddEllipseInRect(context, CGRectMake(220, 150, 70, 70));
	[[UIColor orangeColor] setFill];
	CGContextDrawPath(context, kCGPathFill);
	UIGraphicsPopContext();
	
	// Draw heptagon
	NSArray *points = [self pointsForPolygonWithSides:7 inRect:CGRectMake(230, 250, 70, 70)];
	CGContextBeginPath(context);
	CGPoint firstPoint = [[points objectAtIndex:0] CGPointValue];
	CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
	for (int index = 1; index < [points count]; index++) {
		CGPoint nextPoint = [[points objectAtIndex:index] CGPointValue];
		CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
	}
	CGContextClosePath(context);
	[[UIColor magentaColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);
	UIGraphicsPopContext();
}

- (void)drawSolidFillsInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1].CGColor);
	CGContextFillRect(context, CGRectMake(20, 30, 80, 100));
	UIGraphicsPopContext();
}

- (void)drawGradientFillsInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGFloat colors[] = { 
        1.0, 1.0, 1.0, 1.0, 
        0.0, 0.5, 1.0, 0.8
    };
	
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    // CGColorSpaceRelease(baseSpace), baseSpace = NULL;
	
	CGRect rect = CGRectMake(50, 60, 100, 60);
    CGContextSaveGState(context);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
	
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
	
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient), gradient = NULL;
	
    CGContextRestoreGState(context);
	
    CGContextAddEllipseInRect(context, rect);
    CGContextDrawPath(context, kCGPathStroke);
	
	CGFloat rainbowColors[] = {
		1.0, 0.0, 0.0, 1.0,
		1.0, 0.5, 0.0, 1.0,
		1.0, 1.0, 0.0, 1.0,
		0.0, 1.0, 0.0, 1.0,
		0.0, 1.0, 0.5, 1.0,
		0.0, 0.0, 1.0, 1.0,
		1.0, 0.0, 1.0, 1.0
	};
	CGFloat locations[] = {0, 0.3, 0.4, 0.5, 0.6, 0.7, 0.85};
	CGGradientRef rainbow = CGGradientCreateWithColorComponents(baseSpace, rainbowColors, locations, 7);
	// CGColorSpaceRelease(baseSpace), baseSpace = NULL;
	CGRect square = CGRectMake(160, 20, 140, 140);
	CGContextSaveGState(context);
	CGContextAddRect(context, square);
	CGContextClip(context);
	startPoint = CGPointMake(160, 160);
	endPoint = CGPointMake(300, 20);
	CGContextDrawLinearGradient(context, rainbow, startPoint, endPoint, 0);
	CGGradientRelease(rainbow), rainbow = NULL;
	CGContextRestoreGState(context);
	CGContextAddRect(context, square);
	CGContextDrawPath(context, kCGPathStroke);
	
	// Draw glossy ball
	CGFloat redBallColors[] = {
		1.0, 0.9, 0.9, 0.7,
		1.0, 0.0, 0.0, 0.8
	};
	CGFloat glossLocations[] = {0.05, 0.9};
	CGGradientRef ballGradient = CGGradientCreateWithColorComponents(baseSpace, redBallColors, glossLocations, 2);
	CGRect circleBounds = CGRectMake(20, 250, 100, 100);
	startPoint = CGPointMake(50, 270);
	endPoint = CGPointMake(70, 300);
	CGContextDrawRadialGradient(context, ballGradient, startPoint, 0, endPoint, 50, 0);
	CGContextAddEllipseInRect(context, circleBounds);
	CGContextDrawPath(context, kCGPathStroke);
	
	// Draw background
	CGFloat backgroundColors[] = {
		0.3, 0.3, 0.3, 1.0,
		0.1, 0.1, 0.1, 1.0
	};
	CGGradientRef backgroundGradient = CGGradientCreateWithColorComponents(baseSpace, backgroundColors, NULL, 2);
	CGContextSaveGState(context);
	CGRect backgroundRect = CGRectMake(20, 150, 80, 50);
	CGContextAddRect(context, backgroundRect);
	CGContextClip(context);
	startPoint = CGPointMake(CGRectGetMidX(backgroundRect), CGRectGetMidY(backgroundRect));
	CGContextDrawRadialGradient(context, backgroundGradient, startPoint, 0, startPoint, 35, kCGGradientDrawsAfterEndLocation);
	CGContextRestoreGState(context);
	CGContextAddRect(context, backgroundRect);
	CGContextDrawPath(context, kCGPathStroke);
	
	// Draw cone
	[[UIColor colorWithRed:0 green:0.5 blue:0 alpha:0.5] setStroke];
	CGContextAddEllipseInRect(context, CGRectMake(180, 180, 100, 100));
	CGContextDrawPath(context, kCGPathStroke);
	CGFloat coneColors[] = {
		0.2, 0.8, 0.2, 1.0,
		1.0, 1.0, 0.9, 0.9
	};
	CGGradientRef coneGradient = CGGradientCreateWithColorComponents(baseSpace, coneColors, NULL, 2);
	startPoint = CGPointMake(230, 230);
	endPoint = CGPointMake(280, 330);
	CGContextDrawRadialGradient(context, coneGradient, startPoint, 50, endPoint, 10, 0);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.1 green:0.6 blue:0.1 alpha:0.3].CGColor);
	CGContextAddEllipseInRect(context, CGRectMake(270, 320, 20, 20));
	CGContextDrawPath(context, kCGPathStroke);
	UIGraphicsPopContext();
}

- (void)drawImageAndPatternFillsInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGRect ellipseRect = CGRectMake(20, 30, 100, 80);
	CGContextSaveGState(context);
	CGContextAddEllipseInRect(context, ellipseRect);
	CGContextClip(context);
	[[UIImage imageNamed:@"Image Fill.jpg"] drawInRect:ellipseRect];
	CGContextRestoreGState(context);
	CGContextAddEllipseInRect(context, ellipseRect);
	CGContextDrawPath(context, kCGPathStroke);
	
	CGRect tileRect = CGRectMake(150, 40, 150, 110);
	CGContextSaveGState(context);
	CGContextAddEllipseInRect(context, tileRect);
	CGContextClip(context);		// Clip; otherwise whole rect will be drawn
	[[UIImage imageNamed:@"TileImage.png"] drawAsPatternInRect:tileRect];
	CGContextRestoreGState(context);
	CGContextAddEllipseInRect(context, tileRect);
	CGContextDrawPath(context, kCGPathStroke);
	UIGraphicsPopContext();
}

- (void)drawSimpleAnimationsInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CALayer *pulsingBox = [CALayer layer];
	pulsingBox.backgroundColor = [UIColor whiteColor].CGColor;
	pulsingBox.borderColor = [UIColor blackColor].CGColor;
	pulsingBox.borderWidth = 2.0;
	pulsingBox.cornerRadius = 5.0;
	pulsingBox.frame = CGRectMake(10, 10, 80, 50);
	CABasicAnimation *pulsingAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
	pulsingAnimation.toValue = (__bridge id)([UIColor orangeColor].CGColor);
	pulsingAnimation.duration = 3;
	pulsingAnimation.repeatCount = 10;
	pulsingAnimation.autoreverses = YES;
	[pulsingBox addAnimation:pulsingAnimation forKey:@"pulsingColor"];
	[self.layer addSublayer:pulsingBox];
	UIGraphicsPopContext();
}

- (void)drawBouncesInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	bounceAnimation.removedOnCompletion = YES;
	bounceAnimation.fillMode = kCAFillModeForwards;
	bounceAnimation.duration = 5;
	bounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CGMutablePathRef bouncePath = CGPathCreateMutable();
	CGPathMoveToPoint(bouncePath, NULL, 0, 120);
	CGPathAddArc(bouncePath, NULL, 0, 180, 60, 0.5*M_PI, 0, 0);
	CGPathAddArc(bouncePath, NULL, 120, 180, 60, M_PI, 0, 0);
	CGPathAddArc(bouncePath, NULL, 240, 180, 60, M_PI, 0, 0);
	CGPathAddArc(bouncePath, NULL, 360, 180, 60, M_PI, 0, 0);
	[bounceAnimation setPath:bouncePath];
	
	UIView *animatingView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, 48, 60)];
	animatingView.backgroundColor = [UIColor redColor];
	[self addSubview:animatingView];
	[animatingView.layer addAnimation:bounceAnimation forKey:nil];
	UIGraphicsPopContext();
}

- (void)drawOtherInContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	UIBezierPath *roundedRectQuartz = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 70, 90) cornerRadius:8.0];
	[[UIColor orangeColor] setFill];
	[roundedRectQuartz fill];
	
	UIView *roundedRectView = [[UIView alloc] initWithFrame:CGRectMake(90, 10, 70, 90)];
	roundedRectView.backgroundColor = [UIColor orangeColor];
	roundedRectView.layer.cornerRadius = 8.0;
	[self addSubview:roundedRectView];
	CALayer *shadowBox = [CALayer layer];
	shadowBox.backgroundColor = [UIColor purpleColor].CGColor;
	shadowBox.shadowColor = [UIColor blackColor].CGColor;
	shadowBox.shadowRadius = 1.0;
	shadowBox.shadowOpacity = 0.3;
	shadowBox.shadowOffset = CGSizeMake(1.0, -2.0);
	shadowBox.frame = CGRectMake(120, 30, 20, 30);
	[self.layer addSublayer:shadowBox];
	CALayer *imageBox = [CALayer layer];
	imageBox.backgroundColor = [UIColor blackColor].CGColor;
	imageBox.borderColor = [UIColor whiteColor].CGColor;
	imageBox.borderWidth = 3.0;
	imageBox.cornerRadius = 10.0;
	imageBox.shadowColor = [UIColor blackColor].CGColor;
	imageBox.shadowRadius = 3.0;
	imageBox.shadowOpacity = 0.8;
	imageBox.shadowOffset = CGSizeMake(2.0, 2.0);
	imageBox.frame = CGRectMake(180, 10, 102, 64);
	CALayer *imageLayer = [CALayer layer];
	imageLayer.contents = (id)[UIImage imageNamed:@"Image Fill.jpg"].CGImage;
	imageLayer.cornerRadius = 10.0;
	imageLayer.masksToBounds = YES;
	imageLayer.frame = imageBox.bounds;
	[imageBox addSublayer:imageLayer];
	[self.layer addSublayer:imageBox];
	
	UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	switch (self.mode) {
		case QuartzContentStraightLines:
			[self drawStraightLinesInContext:context];
			break;
		case QuartzContentCurves:
			[self drawCurvesInContext:context];
			break;
		case QuartzContentShapes:
			[self drawCustomShapesInContext:context];
			break;
		case QuartzContentSolidFills:
			[self drawSolidFillsInContext:context];
			break;
		case QuartzContentGradientFills:
			[self drawGradientFillsInContext:context];
			break;
		case QuartzContentImageFills:
			[self drawImageAndPatternFillsInContext:context];
			break;
		case QuartzContentSimpleAnimations:
			[self drawSimpleAnimationsInContext:context];
			break;
		case QuartzContentBounce:
			[self drawBouncesInContext:context];
			break;
		case QuartzContentOther:
			[self drawOtherInContext:context];
			break;
		default:
			break;
	}
}


@end
