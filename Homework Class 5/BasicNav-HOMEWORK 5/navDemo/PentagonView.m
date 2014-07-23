//
//  PentagonView.m
//  DrawPentagon
//
//  Created by ssarber on 9/30/12.
//  Copyright (c) 2012 ssarber. All rights reserved.
//

#import "PentagonView.h"

@implementation PentagonView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 10);

    [[UIColor greenColor] setStroke];
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 140, 10);
    CGContextAddLineToPoint(context, 257, 100);
    
    CGContextMoveToPoint(context, 145, 10);
    CGContextAddLineToPoint(context, 25, 100);
    
    CGContextMoveToPoint(context,27, 97);
    CGContextAddLineToPoint(context, 73, 200);
    
    CGContextMoveToPoint(context,69, 200);
    CGContextAddLineToPoint(context, 203, 200);
    
    CGContextMoveToPoint(context, 200, 201);
    CGContextAddLineToPoint(context, 256, 96);
    
    CGContextStrokePath(context);
    //CGContextDrawPath(context, kCGPathFillStroke);
}

@end
