//
//  StaffDrawingView.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/21/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "StaffDrawingView.h"
#import "TrebleClefSymbol.h"
#import "BassClefSymbol.h"

#define TOP_SPACING 10
#define CENTER_SPACING 10
#define BOTTOM_SPACING 10
#define TICK_SIZE 30
#define NUMBER_LINES 26
#define LEFT_MARGIN 25


@implementation StaffDrawingView

@synthesize grandStaffBrace;

@synthesize spacing;
@synthesize trebleCleffFrame;
@synthesize bassCleffFrame;
@synthesize trebleCleffSymbol;
@synthesize bassCleffSymbol;


-(void) updateFrameSize : (CGRect) rect{
    float usableSpace = rect.size.height - (TOP_SPACING + BOTTOM_SPACING);
    spacing = usableSpace / NUMBER_LINES;
    
    float width = rect.size.width;
    
    trebleCleffFrame = CGRectZero;
    trebleCleffFrame.origin.x = LEFT_MARGIN;
    trebleCleffFrame.origin.y = TOP_SPACING + (spacing*5);
    trebleCleffFrame.size.width = (width-(LEFT_MARGIN*2));
    trebleCleffFrame.size.height = 4*spacing;
    
    bassCleffFrame = CGRectZero;
    bassCleffFrame.origin.x = LEFT_MARGIN;
    bassCleffFrame.origin.y = (trebleCleffFrame.origin.y + trebleCleffFrame.size.height) + CENTER_SPACING + (spacing*5);
    bassCleffFrame.size.width = (width-(LEFT_MARGIN*2));
    bassCleffFrame.size.height = 4*spacing;
}

- (void) setFrame:(CGRect)rect {
    super.frame = rect;
    [self updateFrameSize: rect];
}

-(void) internalInit {
    self.backgroundColor = [UIColor clearColor];
    
    [self updateFrameSize:self.frame];
    
    /**
     TODO:
     The following images are not very resolution independant. There are a lot of magic number that
     don't scale across varing screen sizes.
     **/
    
    // Draw end brace
    self.grandStaffBrace = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grandStaffBrace.png"]];
    CGRect grandStaffFrame = grandStaffBrace.frame;
    grandStaffFrame.size.width = LEFT_MARGIN;
    grandStaffFrame.origin.x = trebleCleffFrame.origin.x - grandStaffFrame.size.width - 5;
    grandStaffFrame.origin.y = trebleCleffFrame.origin.y - 8;
    grandStaffFrame.size.height = (bassCleffFrame.origin.y+bassCleffFrame.size.height) - trebleCleffFrame.origin.y + CENTER_SPACING;
    grandStaffBrace.frame = grandStaffFrame;
    [self addSubview:grandStaffBrace];
    
    // Draw treble cleff sign
    self.trebleCleffSymbol = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trebleClef.png"]];
    CGRect clefFrame = trebleCleffSymbol.frame;
    clefFrame.size.height = 5*spacing;
    clefFrame.size.width = clefFrame.size.height*.75;
    clefFrame.origin.x = trebleCleffFrame.origin.x+5;
    clefFrame.origin.y = trebleCleffFrame.origin.y-spacing;
    trebleCleffSymbol.frame = clefFrame;
    [self addSubview:trebleCleffSymbol];
    
//    TrebleClefSymbol* tSymbol = [[[TrebleClefSymbol alloc] init] autorelease];
//    [tSymbol setFrame:clefFrame];
//    [tSymbol setBackgroundColor:[UIColor clearColor]];
//    [self addSubview:tSymbol];
    
    // Draw bass cleff sign
    self.trebleCleffSymbol = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bassCleff.png"]];
    clefFrame = trebleCleffSymbol.frame;
    clefFrame.size.height = bassCleffFrame.size.height;
    clefFrame.size.width = clefFrame.size.height*.75;
    clefFrame.origin.x = bassCleffFrame.origin.x+5;
    clefFrame.origin.y = bassCleffFrame.origin.y;
    trebleCleffSymbol.frame = clefFrame;
    [self addSubview:trebleCleffSymbol];
    
}

- (instancetype) initWithCoder:(NSCoder *)aCoder {
    if( self = [super initWithCoder:aCoder]){
        [self internalInit];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect]){
        [self internalInit];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
}

- (void) drawStaff:(CGContextRef)ctx staffFrame:(CGRect)staffFrame  lineSpacing:(CGFloat) lineSpacing {
    float staffRightSide = staffFrame.origin.x + staffFrame.size.width;
    
    CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1); 
    CGContextSetLineWidth(ctx, .5);
    
    CGFloat yOffset = staffFrame.origin.y;
    for (int i = 0; i <= 4; i++) {
        
        CGContextMoveToPoint(ctx, staffFrame.origin.x, yOffset);
        CGContextAddLineToPoint( ctx, staffRightSide, yOffset);
        yOffset += (lineSpacing);
    }
    
    CGContextStrokePath(ctx);
    
    // Draw left endcap
    CGContextSetLineWidth(ctx, 8);
    CGContextMoveToPoint(ctx, staffFrame.origin.x, staffFrame.origin.y);
    CGContextAddLineToPoint( ctx, staffFrame.origin.x, staffFrame.origin.y + staffFrame.size.height);
    CGContextStrokePath(ctx);
    
    // Draw right endcap
    CGContextSetLineWidth(ctx, 8);
    CGContextMoveToPoint(ctx, staffRightSide, staffFrame.origin.y);
    CGContextAddLineToPoint( ctx, staffRightSide, staffFrame.origin.y + staffFrame.size.height);
    CGContextStrokePath(ctx);
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"STAFF DRAW RECT");
	CGContextRef ctx = UIGraphicsGetCurrentContext();

    // Draw Treble Staff
    [self drawStaff:ctx staffFrame:trebleCleffFrame lineSpacing:spacing];
    
    // Draw Bass Staff
    [self drawStaff:ctx staffFrame:bassCleffFrame lineSpacing:spacing];
}

-(CGFloat) getNoteYLocation:(NSInteger) keyNumber {
    
    int staffTop = trebleCleffFrame.origin.y;
    
    if (keyNumber < 39) {
        // Base Clef
        staffTop = bassCleffFrame.origin.y;
    }
   
    float keyMultiplier[] = {
    /*   A      A#     B      C      C#     D      D#     E      F      F#     G      G#  */
       11.0f, 11.0f, 10.0f,  9.5f,  9.5f,  9.0f,  9.0f,  8.5f,  8.0f,  8.0f,  7.5f,  7.5f,
        7.0f,  7.0f,  6.5f,  6.0f,  6.0f,  5.5f,  5.5f,  5.0f,  4.5f,  4.50f,  4.0f,  4.0f,  // Bass Clef
        3.5f,  3.5f,  3.0f,  2.5f,  2.5f,  2.0f,  2.0f,  1.5f,  1.0f,  1.0f,  0.5f,  0.5f,
        
        0.0f,  0.0f, -0.5f,  5.0f,  5.0f,  4.5f,  4.5f,  4.0f,  3.5f,  3.5f,  3.0f,  3.0f,  // Middle Octive
        
        2.5f,  2.5f,  2.0f,  1.5f,  1.5f,  1.0f,  1.0f,  0.5f,  0.0f,  0.0f, -0.5f, -0.5f,
       -1.0f, -1.0f, -1.5f, -2.0f, -2.0f, -2.5f, -2.5f, -3.0f, -3.5f, -3.5f, -4.0f, -4.0f,  
       -4.5f, -4.5f, -5.0f, -5.5f, -5.5f, -6.0f, -6.0f, -6.5f, -7.0f, -7.0f, -7.5f, -7.5f,
       -8.0f, -8.0f, -8.5f, -9.0f
    };
    
    return (keyMultiplier[keyNumber] * spacing) + staffTop - (spacing/2);
}


@end
