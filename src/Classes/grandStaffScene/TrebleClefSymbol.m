//
//  TrebleClefSymbol.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/22/11.
//  Copyright 2011 Yepher All rights reserved.
//

#import "TrebleClefSymbol.h"


@implementation TrebleClefSymbol

// "M 181.25,298.8657 C 221.24865,267.60655 144.01236,253.95394 167.75,301.8657 C 172.932,312.32499 223.25,338.3804 223.25,261.8657 C 223.25,204.3657 188.25,131.3657 188.25,102.3657 C 188.25,73.3657 211.25,57.8657 211.25,96.3657 C 211.25,134.8657 154.75,167.8657 154.75,207.8657 C 154.75,273.90014 245.25,274.89932 245.25,225.8657 C 245.25,180.36295 202.92331,178.96216 189.25,190.3657 C 169.73581,206.64053 176.80703,238.26589 199.75,240.3657 C 166.09356,197.25935 231.44526,185.95387 235.75,222.3657 C 240.48256,262.39621 166.25,263.53037 166.25,214.8657 C 166.25,176.3657 227.52186,137.26447 224.75,99.3657 C 220.75,44.675 184.88913,27.76714 180.75,94.3657 C 177.84025,140.68365 215.58053,199.38507 217.25,264.8657 C 218.31602,306.67739 186.93198,317.71925 181.25,298.8657 z "

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

 

-(CGFloat) normalizeX:(CGFloat) x {
    return x - 144.01236;
}

-(CGFloat) normalizeY:(CGFloat) y {
    return y - 27.76714;
}

// startPath
-(void) drawObject {
    UIColor* strokeColor = [UIColor blackColor];
    UIColor* fillColor = [UIColor blackColor];
    
    float rescaleXBy = 0.1;
    float rescaleYBy = 0.1;
    BOOL fillPath = YES;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGContextClearRect(ctx, [self frame]);

    if (fillPath) {
        CGContextSetFillColor(ctx, CGColorGetComponents( [fillColor CGColor]) );
    }
    CGContextSetStrokeColor(ctx, CGColorGetComponents( [strokeColor CGColor])); 
    CGContextSetLineWidth(ctx, .5);
    // movetoAbs(181.25, 298.8657)
    CGContextMoveToPoint(ctx, [self normalizeX:181.25]*rescaleXBy, [self normalizeY:298.8657]*rescaleYBy);
    
    // curvetoCubicAbs(221.24866, 267.60654, 144.01236, 253.95393, 167.75, 301.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:221.24866]*rescaleXBy, [self normalizeY:267.60654]*rescaleYBy, [self normalizeX:144.01236]*rescaleXBy, [self normalizeY:253.95393]*rescaleYBy, [self normalizeX:167.75]*rescaleXBy, [self normalizeY:301.8657]*rescaleYBy);
    
    // curvetoCubicAbs(172.932, 312.32498, 223.25, 338.3804, 223.25, 261.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:172.932]*rescaleXBy, [self normalizeY:312.32498]*rescaleYBy, [self normalizeX:223.25]*rescaleXBy, [self normalizeY:338.3804]*rescaleYBy, [self normalizeX:223.25]*rescaleXBy, [self normalizeY:261.8657]*rescaleYBy);
    
    // curvetoCubicAbs(223.25, 204.3657, 188.25, 131.3657, 188.25, 102.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:223.25]*rescaleXBy, [self normalizeY:204.3657]*rescaleYBy, [self normalizeX:188.25]*rescaleXBy, [self normalizeY:131.3657]*rescaleYBy, [self normalizeX:188.25]*rescaleXBy, [self normalizeY:102.3657]*rescaleYBy);
    
    // curvetoCubicAbs(188.25, 73.3657, 211.25, 57.8657, 211.25, 96.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:188.25]*rescaleXBy, [self normalizeY:73.3657]*rescaleYBy, [self normalizeX:211.25]*rescaleXBy, [self normalizeY:57.8657]*rescaleYBy, [self normalizeX:211.25]*rescaleXBy, [self normalizeY:96.3657]*rescaleYBy);
    
    // curvetoCubicAbs(211.25, 134.8657, 154.75, 167.8657, 154.75, 207.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:211.25]*rescaleXBy, [self normalizeY:134.8657]*rescaleYBy, [self normalizeX:154.75]*rescaleXBy, [self normalizeY:167.8657]*rescaleYBy, [self normalizeX:154.75]*rescaleXBy, [self normalizeY:207.8657]*rescaleYBy);
    
    // curvetoCubicAbs(154.75, 273.90015, 245.25, 274.89932, 245.25, 225.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:154.75]*rescaleXBy, [self normalizeY:273.90015]*rescaleYBy, [self normalizeX:245.25]*rescaleXBy, [self normalizeY:274.89932]*rescaleYBy, [self normalizeX:245.25]*rescaleXBy, [self normalizeY:225.8657]*rescaleYBy);
    
    // curvetoCubicAbs(245.25, 180.36295, 202.92331, 178.96216, 189.25, 190.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:245.25]*rescaleXBy, [self normalizeY:180.36295]*rescaleYBy, [self normalizeX:202.92331]*rescaleXBy, [self normalizeY:178.96216]*rescaleYBy, [self normalizeX:189.25]*rescaleXBy, [self normalizeY:190.3657]*rescaleYBy);
    
    // curvetoCubicAbs(169.73581, 206.64053, 176.80704, 238.26588, 199.75, 240.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:169.73581]*rescaleXBy, [self normalizeY:206.64053]*rescaleYBy, [self normalizeX:176.80704]*rescaleXBy, [self normalizeY:238.26588]*rescaleYBy, [self normalizeX:199.75]*rescaleXBy, [self normalizeY:240.3657]*rescaleYBy);
    
    // curvetoCubicAbs(166.09357, 197.25935, 231.44527, 185.95387, 235.75, 222.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:166.09357]*rescaleXBy, [self normalizeY:197.25935]*rescaleYBy, [self normalizeX:231.44527]*rescaleXBy, [self normalizeY:185.95387]*rescaleYBy, [self normalizeX:235.75]*rescaleXBy, [self normalizeY:222.3657]*rescaleYBy);
    
    // curvetoCubicAbs(240.48256, 262.3962, 166.25, 263.53036, 166.25, 214.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:240.48256]*rescaleXBy, [self normalizeY:262.3962]*rescaleYBy, [self normalizeX:166.25]*rescaleXBy, [self normalizeY:263.53036]*rescaleYBy, [self normalizeX:166.25]*rescaleXBy, [self normalizeY:214.8657]*rescaleYBy);
    
    // curvetoCubicAbs(166.25, 176.3657, 227.52187, 137.26447, 224.75, 99.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:166.25]*rescaleXBy, [self normalizeY:176.3657]*rescaleYBy, [self normalizeX:227.52187]*rescaleXBy, [self normalizeY:137.26447]*rescaleYBy, [self normalizeX:224.75]*rescaleXBy, [self normalizeY:99.3657]*rescaleYBy);
    
    // curvetoCubicAbs(220.75, 44.675, 184.88913, 27.76714, 180.75, 94.3657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:220.75]*rescaleXBy, [self normalizeY:44.675]*rescaleYBy, [self normalizeX:184.88913]*rescaleXBy, [self normalizeY:27.76714]*rescaleYBy, [self normalizeX:180.75]*rescaleXBy, [self normalizeY:94.3657]*rescaleYBy);
    
    // curvetoCubicAbs(177.84026, 140.68365, 215.58054, 199.38507, 217.25, 264.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:177.84026]*rescaleXBy, [self normalizeY:140.68365]*rescaleYBy, [self normalizeX:215.58054]*rescaleXBy, [self normalizeY:199.38507]*rescaleYBy, [self normalizeX:217.25]*rescaleXBy, [self normalizeY:264.8657]*rescaleYBy);
    
    // curvetoCubicAbs(218.31602, 306.6774, 186.93198, 317.71924, 181.25, 298.8657)
    CGContextAddCurveToPoint (ctx, [self normalizeX:218.31602]*rescaleXBy, [self normalizeY:306.6774]*rescaleYBy, [self normalizeX:186.93198]*rescaleXBy, [self normalizeY:317.71924]*rescaleYBy, [self normalizeX:181.25]*rescaleXBy, [self normalizeY:298.8657]*rescaleYBy);
    
    // closePath
    CGContextClosePath (ctx);
    if (fillPath) {
        CGContextFillPath (ctx);
    }
    CGContextStrokePath(ctx);
    
    
} // endPath 




-(void) drawRect:(CGRect)rect {
    [self drawObject];
}



@end
