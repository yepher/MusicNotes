//
//  BassClefSymbol.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/22/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "BassClefSymbol.h"


@implementation BassClefSymbol

// "M 243.97900,540.86798 C 244.02398,543.69258 242.76360,546.43815 240.76469,548.40449 C 238.27527,550.89277 235.01791,552.47534 231.69762,553.53261 C 231.25590,553.77182 230.58970,553.45643 231.28550,553.13144 C 232.62346,552.52289 234.01319,552.00050 235.24564,551.18080 C 237.96799,549.49750 240.26523,546.84674 240.82279,543.61854 C 241.14771,541.65352 241.05724,539.60795 240.56484,537.67852 C 240.20352,536.25993 239.22033,534.79550 237.66352,534.58587 C 236.25068,534.36961 234.74885,534.85905 233.74057,535.88093 C 233.47541,536.14967 232.95916,536.89403 233.04435,537.74747 C 233.64637,537.27468 233.60528,537.32732 234.09900,537.10717 C 235.23573,536.60031 236.74349,537.32105 237.02700,538.57272 C 237.32909,539.72295 237.09551,541.18638 235.96036,541.79960 C 234.77512,542.44413 233.02612,542.17738 232.36450,540.90866 C 231.26916,538.95418 231.87147,536.28193 233.64202,534.92571 C 235.44514,533.42924 238.07609,533.37089 240.19963,534.13862 C 242.38419,534.95111 243.68629,537.21483 243.89691,539.45694 C 243.95419,539.92492 243.97896,540.39668 243.97900,540.86798 z "

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}



-(float) normalizeX:(float) x {
    return x - 230.5897;
}

-(float) normalizeY:(float) y {
    return y - 533.3709;
}

// startPath
-(void) drawObject {
    float rescaleBy = 0.5;
    BOOL fillPath = true;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (fillPath) {
        CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0 );
    }
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1); 
    CGContextSetLineWidth(ctx, .5);
    // movetoAbs(243.979, 540.868)
    CGContextMoveToPoint(ctx, [self normalizeX:243.979]*rescaleBy, [self normalizeY:540.868]*rescaleBy);
    
    // curvetoCubicAbs(244.02399, 543.69257, 242.7636, 546.4382, 240.7647, 548.4045)
    CGContextAddCurveToPoint (ctx, [self normalizeX:244.02399]*rescaleBy, [self normalizeY:543.69257]*rescaleBy, [self normalizeX:242.7636]*rescaleBy, [self normalizeY:546.4382]*rescaleBy, [self normalizeX:240.7647]*rescaleBy, [self normalizeY:548.4045]*rescaleBy);
    
    // curvetoCubicAbs(238.27527, 550.89276, 235.01791, 552.47534, 231.69762, 553.5326)
    CGContextAddCurveToPoint (ctx, [self normalizeX:238.27527]*rescaleBy, [self normalizeY:550.89276]*rescaleBy, [self normalizeX:235.01791]*rescaleBy, [self normalizeY:552.47534]*rescaleBy, [self normalizeX:231.69762]*rescaleBy, [self normalizeY:553.5326]*rescaleBy);
    
    // curvetoCubicAbs(231.2559, 553.7718, 230.5897, 553.4564, 231.2855, 553.1315)
    CGContextAddCurveToPoint (ctx, [self normalizeX:231.2559]*rescaleBy, [self normalizeY:553.7718]*rescaleBy, [self normalizeX:230.5897]*rescaleBy, [self normalizeY:553.4564]*rescaleBy, [self normalizeX:231.2855]*rescaleBy, [self normalizeY:553.1315]*rescaleBy);
    
    // curvetoCubicAbs(232.62346, 552.5229, 234.01318, 552.0005, 235.24564, 551.1808)
    CGContextAddCurveToPoint (ctx, [self normalizeX:232.62346]*rescaleBy, [self normalizeY:552.5229]*rescaleBy, [self normalizeX:234.01318]*rescaleBy, [self normalizeY:552.0005]*rescaleBy, [self normalizeX:235.24564]*rescaleBy, [self normalizeY:551.1808]*rescaleBy);
    
    // curvetoCubicAbs(237.96799, 549.4975, 240.26523, 546.84674, 240.82278, 543.6185)
    CGContextAddCurveToPoint (ctx, [self normalizeX:237.96799]*rescaleBy, [self normalizeY:549.4975]*rescaleBy, [self normalizeX:240.26523]*rescaleBy, [self normalizeY:546.84674]*rescaleBy, [self normalizeX:240.82278]*rescaleBy, [self normalizeY:543.6185]*rescaleBy);
    
    // curvetoCubicAbs(241.1477, 541.6535, 241.05724, 539.608, 240.56483, 537.6785)
    CGContextAddCurveToPoint (ctx, [self normalizeX:241.1477]*rescaleBy, [self normalizeY:541.6535]*rescaleBy, [self normalizeX:241.05724]*rescaleBy, [self normalizeY:539.608]*rescaleBy, [self normalizeX:240.56483]*rescaleBy, [self normalizeY:537.6785]*rescaleBy);
    
    // curvetoCubicAbs(240.20352, 536.25995, 239.22034, 534.7955, 237.66351, 534.5859)
    CGContextAddCurveToPoint (ctx, [self normalizeX:240.20352]*rescaleBy, [self normalizeY:536.25995]*rescaleBy, [self normalizeX:239.22034]*rescaleBy, [self normalizeY:534.7955]*rescaleBy, [self normalizeX:237.66351]*rescaleBy, [self normalizeY:534.5859]*rescaleBy);
    
    // curvetoCubicAbs(236.25069, 534.3696, 234.74886, 534.8591, 233.74057, 535.8809)
    CGContextAddCurveToPoint (ctx, [self normalizeX:236.25069]*rescaleBy, [self normalizeY:534.3696]*rescaleBy, [self normalizeX:234.74886]*rescaleBy, [self normalizeY:534.8591]*rescaleBy, [self normalizeX:233.74057]*rescaleBy, [self normalizeY:535.8809]*rescaleBy);
    
    // curvetoCubicAbs(233.4754, 536.14966, 232.95917, 536.89404, 233.04436, 537.7475)
    CGContextAddCurveToPoint (ctx, [self normalizeX:233.4754]*rescaleBy, [self normalizeY:536.14966]*rescaleBy, [self normalizeX:232.95917]*rescaleBy, [self normalizeY:536.89404]*rescaleBy, [self normalizeX:233.04436]*rescaleBy, [self normalizeY:537.7475]*rescaleBy);
    
    // curvetoCubicAbs(233.64638, 537.27466, 233.60529, 537.32733, 234.099, 537.1072)
    CGContextAddCurveToPoint (ctx, [self normalizeX:233.64638]*rescaleBy, [self normalizeY:537.27466]*rescaleBy, [self normalizeX:233.60529]*rescaleBy, [self normalizeY:537.32733]*rescaleBy, [self normalizeX:234.099]*rescaleBy, [self normalizeY:537.1072]*rescaleBy);
    
    // curvetoCubicAbs(235.23573, 536.6003, 236.74348, 537.32104, 237.027, 538.5727)
    CGContextAddCurveToPoint (ctx, [self normalizeX:235.23573]*rescaleBy, [self normalizeY:536.6003]*rescaleBy, [self normalizeX:236.74348]*rescaleBy, [self normalizeY:537.32104]*rescaleBy, [self normalizeX:237.027]*rescaleBy, [self normalizeY:538.5727]*rescaleBy);
    
    // curvetoCubicAbs(237.32909, 539.72296, 237.0955, 541.1864, 235.96036, 541.7996)
    CGContextAddCurveToPoint (ctx, [self normalizeX:237.32909]*rescaleBy, [self normalizeY:539.72296]*rescaleBy, [self normalizeX:237.0955]*rescaleBy, [self normalizeY:541.1864]*rescaleBy, [self normalizeX:235.96036]*rescaleBy, [self normalizeY:541.7996]*rescaleBy);
    
    // curvetoCubicAbs(234.77512, 542.44415, 233.02612, 542.17737, 232.3645, 540.9086)
    CGContextAddCurveToPoint (ctx, [self normalizeX:234.77512]*rescaleBy, [self normalizeY:542.44415]*rescaleBy, [self normalizeX:233.02612]*rescaleBy, [self normalizeY:542.17737]*rescaleBy, [self normalizeX:232.3645]*rescaleBy, [self normalizeY:540.9086]*rescaleBy);
    
    // curvetoCubicAbs(231.26917, 538.95416, 231.87148, 536.2819, 233.64201, 534.9257)
    CGContextAddCurveToPoint (ctx, [self normalizeX:231.26917]*rescaleBy, [self normalizeY:538.95416]*rescaleBy, [self normalizeX:231.87148]*rescaleBy, [self normalizeY:536.2819]*rescaleBy, [self normalizeX:233.64201]*rescaleBy, [self normalizeY:534.9257]*rescaleBy);
    
    // curvetoCubicAbs(235.44514, 533.42926, 238.0761, 533.3709, 240.19963, 534.1386)
    CGContextAddCurveToPoint (ctx, [self normalizeX:235.44514]*rescaleBy, [self normalizeY:533.42926]*rescaleBy, [self normalizeX:238.0761]*rescaleBy, [self normalizeY:533.3709]*rescaleBy, [self normalizeX:240.19963]*rescaleBy, [self normalizeY:534.1386]*rescaleBy);
    
    // curvetoCubicAbs(242.38419, 534.9511, 243.6863, 537.21484, 243.89691, 539.457)
    CGContextAddCurveToPoint (ctx, [self normalizeX:242.38419]*rescaleBy, [self normalizeY:534.9511]*rescaleBy, [self normalizeX:243.6863]*rescaleBy, [self normalizeY:537.21484]*rescaleBy, [self normalizeX:243.89691]*rescaleBy, [self normalizeY:539.457]*rescaleBy);
    
    // curvetoCubicAbs(243.9542, 539.9249, 243.97896, 540.39667, 243.979, 540.868)
    CGContextAddCurveToPoint (ctx, [self normalizeX:243.9542]*rescaleBy, [self normalizeY:539.9249]*rescaleBy, [self normalizeX:243.97896]*rescaleBy, [self normalizeY:540.39667]*rescaleBy, [self normalizeX:243.979]*rescaleBy, [self normalizeY:540.868]*rescaleBy);
    
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
