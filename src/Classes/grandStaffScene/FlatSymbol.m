//
//  FlatSymbol.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/31/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "FlatSymbol.h"


@implementation FlatSymbol


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}



// Path Data is: M 14.2687,5.9946343 L 14.2687,87.356595 C 14.268692,87.356651 14.268692,94.136808 14.2687,107.69709 C 23.803287,99.010046 34.503222,94.560568 46.368536,94.348639 C 53.784292,94.348688 60.140689,97.420946 65.437746,103.56542 C 70.099044,109.28622 72.535663,115.64262 72.747609,122.63463 C 72.959423,128.14353 71.582203,134.49993 68.615947,141.70384 C 67.556485,144.67016 65.225806,147.84836 61.623904,151.23845 C 58.86941,153.781 56.009031,156.4295 53.04276,159.18395 C 37.3636,170.62545 21.684488,182.1729 6.0053759,193.82635 L 6.0053759,5.9946343 L 14.2687,5.9946343 M 40.012133,114.68913 C 37.46954,111.72284 34.185402,110.23968 30.159708,110.23965 C 25.074566,110.23968 20.942908,113.10006 17.764722,118.82079 C 15.434031,123.27029 14.268692,133.75835 14.2687,150.28499 L 14.2687,177.61752 C 14.480572,178.46501 20.413209,173.27395 32.066629,162.04433 C 38.423,156.11168 42.554658,149.11964 44.461615,141.0682 C 45.309096,137.89001 45.732856,134.71181 45.732896,131.5336 C 45.732856,124.54157 43.825937,118.92676 40.012133,114.68913

-(CGFloat) normalizeX:(CGFloat) x {
    return x - 6.005376;
}

-(CGFloat) normalizeY:(CGFloat) y {
    return y - 5.994634;
}

// startPath
-(void) drawObject {
    float rescaleXBy = 0.0001;
    float rescaleYBy = 0.0001;
    BOOL fillPath = NO;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (fillPath) {
        CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0 );
    }
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1); 
    CGContextSetLineWidth(ctx, .5);
    // movetoAbs(14.2687, 5.994634)
    CGContextMoveToPoint(ctx, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:5.994634]*rescaleYBy);
    
    // TODO linetoAbs(14.2687, 87.3566)
    CGContextAddLineToPoint( ctx, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:87.3566]*rescaleYBy);
    
    // curvetoCubicAbs(14.268692, 87.35665, 14.268692, 94.13681, 14.2687, 107.69709)
    CGContextAddCurveToPoint (ctx, [self normalizeX:14.268692]*rescaleXBy, [self normalizeY:87.35665]*rescaleYBy, [self normalizeX:14.268692]*rescaleXBy, [self normalizeY:94.13681]*rescaleYBy, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:107.69709]*rescaleYBy);
    
    // curvetoCubicAbs(23.803288, 99.01005, 34.503223, 94.56057, 46.368538, 94.34864)
    CGContextAddCurveToPoint (ctx, [self normalizeX:23.803288]*rescaleXBy, [self normalizeY:99.01005]*rescaleYBy, [self normalizeX:34.503223]*rescaleXBy, [self normalizeY:94.56057]*rescaleYBy, [self normalizeX:46.368538]*rescaleXBy, [self normalizeY:94.34864]*rescaleYBy);
    
    // curvetoCubicAbs(53.78429, 94.34869, 60.14069, 97.420944, 65.437744, 103.56542)
    CGContextAddCurveToPoint (ctx, [self normalizeX:53.78429]*rescaleXBy, [self normalizeY:94.34869]*rescaleYBy, [self normalizeX:60.14069]*rescaleXBy, [self normalizeY:97.420944]*rescaleYBy, [self normalizeX:65.437744]*rescaleXBy, [self normalizeY:103.56542]*rescaleYBy);
    
    // curvetoCubicAbs(70.099045, 109.28622, 72.53567, 115.64262, 72.74761, 122.63463)
    CGContextAddCurveToPoint (ctx, [self normalizeX:70.099045]*rescaleXBy, [self normalizeY:109.28622]*rescaleYBy, [self normalizeX:72.53567]*rescaleXBy, [self normalizeY:115.64262]*rescaleYBy, [self normalizeX:72.74761]*rescaleXBy, [self normalizeY:122.63463]*rescaleYBy);
    
    // curvetoCubicAbs(72.95943, 128.14352, 71.58221, 134.49992, 68.61595, 141.70384)
    CGContextAddCurveToPoint (ctx, [self normalizeX:72.95943]*rescaleXBy, [self normalizeY:128.14352]*rescaleYBy, [self normalizeX:71.58221]*rescaleXBy, [self normalizeY:134.49992]*rescaleYBy, [self normalizeX:68.61595]*rescaleXBy, [self normalizeY:141.70384]*rescaleYBy);
    
    // curvetoCubicAbs(67.55649, 144.67017, 65.22581, 147.84836, 61.623905, 151.23845)
    CGContextAddCurveToPoint (ctx, [self normalizeX:67.55649]*rescaleXBy, [self normalizeY:144.67017]*rescaleYBy, [self normalizeX:65.22581]*rescaleXBy, [self normalizeY:147.84836]*rescaleYBy, [self normalizeX:61.623905]*rescaleXBy, [self normalizeY:151.23845]*rescaleYBy);
    
    // curvetoCubicAbs(58.86941, 153.781, 56.00903, 156.4295, 53.04276, 159.18394)
    CGContextAddCurveToPoint (ctx, [self normalizeX:58.86941]*rescaleXBy, [self normalizeY:153.781]*rescaleYBy, [self normalizeX:56.00903]*rescaleXBy, [self normalizeY:156.4295]*rescaleYBy, [self normalizeX:53.04276]*rescaleXBy, [self normalizeY:159.18394]*rescaleYBy);
    
    // curvetoCubicAbs(37.3636, 170.62544, 21.684488, 182.1729, 6.005376, 193.82635)
    CGContextAddCurveToPoint (ctx, [self normalizeX:37.3636]*rescaleXBy, [self normalizeY:170.62544]*rescaleYBy, [self normalizeX:21.684488]*rescaleXBy, [self normalizeY:182.1729]*rescaleYBy, [self normalizeX:6.005376]*rescaleXBy, [self normalizeY:193.82635]*rescaleYBy);
    
    // TODO linetoAbs(6.005376, 5.994634)
    CGContextAddLineToPoint( ctx, [self normalizeX:6.005376]*rescaleXBy, [self normalizeY:5.994634]*rescaleYBy);
    
    // TODO linetoAbs(14.2687, 5.994634)
    CGContextAddLineToPoint( ctx, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:5.994634]*rescaleYBy);
    
    // movetoAbs(40.012135, 114.68913)
    CGContextMoveToPoint(ctx, [self normalizeX:40.012135]*rescaleXBy, [self normalizeY:114.68913]*rescaleYBy);
    
    // curvetoCubicAbs(37.46954, 111.72284, 34.185402, 110.23968, 30.159708, 110.23965)
    CGContextAddCurveToPoint (ctx, [self normalizeX:37.46954]*rescaleXBy, [self normalizeY:111.72284]*rescaleYBy, [self normalizeX:34.185402]*rescaleXBy, [self normalizeY:110.23968]*rescaleYBy, [self normalizeX:30.159708]*rescaleXBy, [self normalizeY:110.23965]*rescaleYBy);
    
    // curvetoCubicAbs(25.074566, 110.23968, 20.942907, 113.10006, 17.764723, 118.82079)
    CGContextAddCurveToPoint (ctx, [self normalizeX:25.074566]*rescaleXBy, [self normalizeY:110.23968]*rescaleYBy, [self normalizeX:20.942907]*rescaleXBy, [self normalizeY:113.10006]*rescaleYBy, [self normalizeX:17.764723]*rescaleXBy, [self normalizeY:118.82079]*rescaleYBy);
    
    // curvetoCubicAbs(15.434031, 123.27029, 14.268692, 133.75835, 14.2687, 150.28499)
    CGContextAddCurveToPoint (ctx, [self normalizeX:15.434031]*rescaleXBy, [self normalizeY:123.27029]*rescaleYBy, [self normalizeX:14.268692]*rescaleXBy, [self normalizeY:133.75835]*rescaleYBy, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:150.28499]*rescaleYBy);
    
    // TODO linetoAbs(14.2687, 177.61752)
    CGContextAddLineToPoint( ctx, [self normalizeX:14.2687]*rescaleXBy, [self normalizeY:177.61752]*rescaleYBy);
    
    // curvetoCubicAbs(14.480572, 178.46501, 20.41321, 173.27396, 32.066628, 162.04433)
    CGContextAddCurveToPoint (ctx, [self normalizeX:14.480572]*rescaleXBy, [self normalizeY:178.46501]*rescaleYBy, [self normalizeX:20.41321]*rescaleXBy, [self normalizeY:173.27396]*rescaleYBy, [self normalizeX:32.066628]*rescaleXBy, [self normalizeY:162.04433]*rescaleYBy);
    
    // curvetoCubicAbs(38.423, 156.11168, 42.554657, 149.11964, 44.461617, 141.0682)
    CGContextAddCurveToPoint (ctx, [self normalizeX:38.423]*rescaleXBy, [self normalizeY:156.11168]*rescaleYBy, [self normalizeX:42.554657]*rescaleXBy, [self normalizeY:149.11964]*rescaleYBy, [self normalizeX:44.461617]*rescaleXBy, [self normalizeY:141.0682]*rescaleYBy);
    
    // curvetoCubicAbs(45.309097, 137.89001, 45.732857, 134.7118, 45.732895, 131.5336)
    CGContextAddCurveToPoint (ctx, [self normalizeX:45.309097]*rescaleXBy, [self normalizeY:137.89001]*rescaleYBy, [self normalizeX:45.732857]*rescaleXBy, [self normalizeY:134.7118]*rescaleYBy, [self normalizeX:45.732895]*rescaleXBy, [self normalizeY:131.5336]*rescaleYBy);
    
    // curvetoCubicAbs(45.732857, 124.54157, 43.825935, 118.92676, 40.012135, 114.68913)
    CGContextAddCurveToPoint (ctx, [self normalizeX:45.732857]*rescaleXBy, [self normalizeY:124.54157]*rescaleYBy, [self normalizeX:43.825935]*rescaleXBy, [self normalizeY:118.92676]*rescaleYBy, [self normalizeX:40.012135]*rescaleXBy, [self normalizeY:114.68913]*rescaleYBy);
    
} // endPath 


-(void) drawRect:(CGRect)rect {
    [self drawObject];
}


@end
