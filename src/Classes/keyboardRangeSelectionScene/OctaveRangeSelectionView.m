//
//  OctaveRangeSelectionView.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/19/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "OctaveRangeSelectionView.h"


@implementation OctaveRangeSelectionView

@synthesize delegate;
@synthesize startLocation;
@synthesize keyboadBackground;
@synthesize maskView;


- (void) internalInit{
    [self setDelegate:nil];
    self.backgroundColor = [UIColor yellowColor];
    
    // Keyboard background
    UIImageView* keyboad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keyboardRange.png"]];
    keyboad.frame = self.bounds;
    self.keyboadBackground = keyboad;
    [self addSubview:keyboad];
    
    // Range Mask overlay
    CGRect maskFrame = CGRectZero;
    maskFrame.origin.y = 0;
    maskFrame.size.width = self.bounds.size.width/4;
    maskFrame.origin.x = maskFrame.size.width*2.5;
    maskFrame.size.height = self.bounds.size.height;
    UIImageView* imageMask = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1px-translucent.png"]];
    imageMask.frame = maskFrame;
    self.maskView = imageMask;
    [self addSubview:imageMask];
    
    //NSLog(@"Keycount = %f", self.bounds.size.width/56);
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

- (CGFloat)distanceBetweenTwoXPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint {
    
    float x = toPoint.x - fromPoint.x;
    
    return sqrt(x * x);
}


- (CGFloat)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint {
    
    float x = toPoint.x - fromPoint.x;
    float y = toPoint.y -fromPoint.y;
    
    return sqrt(x * x + y * y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSLog(@"Touches Moved");
        
    NSSet *allTouches = event.allTouches;
    
    switch (allTouches.count) {
        case 1: {
            CGPoint pt = [[touches anyObject] locationInView:maskView];
            CGRect myFrame = maskView.frame;
            float deltaX = pt.x - startLocation.x;
            myFrame.origin.x += pt.x - startLocation.x;

            if (deltaX > 0 && (myFrame.origin.x + myFrame.size.width) <= (self.bounds.origin.x + self.bounds.size.width)){
                maskView.frame = myFrame;
            } else if (deltaX > 0) {
                myFrame.origin.x = (self.bounds.origin.x + self.bounds.size.width) - myFrame.size.width;
                maskView.frame = myFrame;
            } else if (deltaX < 0 && myFrame.origin.x >= self.bounds.origin.x) {
                maskView.frame = myFrame;
            } else if (deltaX < 0) {
                myFrame.origin.x = self.bounds.origin.x;
                maskView.frame = myFrame;
            }
            break;
        } case 2: {
            UITouch *touch1 = allTouches.allObjects[0];
            UITouch *touch2 = allTouches.allObjects[1];
            
            //Calculate the distance between the two fingers.
            CGFloat finalDistance = [self distanceBetweenTwoXPoints:[touch1 locationInView:self]
                                                           toPoint:[touch2 locationInView:self]];
            
            
            if (previousDistance != 0) {
                //Check if zoom in or zoom out.
               if(finalDistance > previousDistance) {
                   //NSLog(@"Zoom Out %f", finalDistance);
                   float deltaWidth = finalDistance - previousDistance; 
                   CGRect maskFrame = maskView.frame;
                   maskFrame.size.width += deltaWidth;
                   maskFrame.origin.x -= deltaWidth/2;
                   if (maskFrame.size.width > keyboadBackground.frame.size.width) {
                       maskFrame.size.width = keyboadBackground.frame.size.width;
                   }
                   
                   if (maskFrame.origin.x < keyboadBackground.frame.origin.x) {
                       maskFrame.origin.x = keyboadBackground.frame.origin.x;
                   }
                   // TODO make sure mask does not go off right hand side
                   maskView.frame = maskFrame;
                   
                } else if (previousDistance > finalDistance) {
                    //NSLog(@"Zoom In %f", finalDistance);
                    float deltaWidth = finalDistance - previousDistance; 
                    CGRect maskFrame = maskView.frame;
                    maskFrame.size.width += deltaWidth;
                    maskFrame.origin.x -= deltaWidth/2;
                    if (maskFrame.size.width < 20) {
                        maskFrame.size.width = 50;
                    }
                    maskView.frame = maskFrame;
                }  
            }
            
            //NSLog(@"Range %f ivory keys", (maskView.frame.size.width/keyboadBackground.frame.size.width)*52);
            previousDistance = finalDistance;
            break;
        }
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSLog(@"Mask::touchesBegan");
    NSSet *allTouches = event.allTouches;
    switch (allTouches.count) {
        case 1: {    
            CGPoint pt = [[touches anyObject] locationInView:maskView];
            startLocation = pt;
            break;
        }
        case 2: {
            //Track the initial distance between two fingers.
            UITouch *touch1 = allTouches.allObjects[0];
            UITouch *touch2 = allTouches.allObjects[1];
            
            initialDistance = [self distanceBetweenTwoXPoints:[touch1 locationInView:self]
                                                     toPoint:[touch2 locationInView:self]];
            
            previousDistance = initialDistance;
            //NSLog(@"Initial Distance %f", initialDistance);
        }
        default: {
            
        }
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSSet *allTouches = [touches setByAddingObjectsFromSet:[event touchesForView:self]];
	//NSLog(@"Mask::touchesEnded allTouches: %i", [allTouches count]);
    initialDistance = 0;
    previousDistance = 0;

    if (self.delegate != nil) {
        NSInteger numKeys = lround((maskView.frame.size.width/keyboadBackground.frame.size.width)*52);
        NSInteger offset = lround(( (maskView.frame.origin.x-keyboadBackground.frame.origin.x) /keyboadBackground.frame.size.width)*52);
        
        NSRange newRange = NSMakeRange(offset, numKeys);
        [self.delegate rangeChanged:newRange];
        
    }
}

@end
