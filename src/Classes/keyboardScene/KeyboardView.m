//
//  KeyboardView.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/16/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "KeyboardView.h"
#import "KeyBase.h"
#import "IvoryKeyView.h"
#import "EbonyKeyView.h"


@implementation KeyboardView

@synthesize doubleEbonySize;
@synthesize delegate;
@synthesize visibleKeyRange;
@synthesize keyNames;
@synthesize keys;



/**
 visibleKeyRange.location represents the number of ivory keys but the keyNames array contains 
 ebony keys as well, so this maps visibleKeyRange.location to keynames array index
 **/
- (NSInteger) convertToKeynameOffset: (NSUInteger) location {
    NSInteger indexes[] = {0, 2, 3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24, 26, 27, 29, 31, 32, 34, 36, 38, 39, 41, 43, 44, 46, 48, 50, 51, 53, 55, 56, 58, 60, 62, 63, 65, 67, 68, 70, 72, 74, 75, 77, 79, 80, 82, 84, 86, 87 };
    return indexes[location];
}

- (void) addIvoryKey:(NSInteger)keyIndex ivoryIndex:(NSInteger)ivoryIndex ivoryWidth:(CGFloat)ivoryWidth keyBackground:(UIImage*)keyBackground keyHighlightBackground:(UIImage*)keyHighlightBackground title:(NSString*)title {
    IvoryKeyView* key = [[IvoryKeyView alloc] initWithImage:keyBackground];
    [key setIntId:keyIndex];
    
    [keys addObject:key];
    [[key label] setText:title];
    
    CGRect keyFrame = CGRectZero;
    keyFrame.size.width = ivoryWidth;
    keyFrame.size.height = self.frame.size.height;
    keyFrame.origin.x = ivoryWidth*ivoryIndex;
    [key setFrame:keyFrame];
    
    [key setHighlightedImage:keyHighlightBackground];
    
    [key setHighlighted:NO];
    [key setUserInteractionEnabled:NO];
    
    [self addSubview:key];
    [self sendSubviewToBack:key];
}

- (void) addEbonyKey:(NSInteger)keyIndex ivoryIndex:(NSInteger)ivoryIndex ivoryWidth:(CGFloat)ivoryWidth ebonyWidth:(CGFloat)ebonyWidth keyBackground:(UIImage*)keyBackground keyHighlightBackground:(UIImage*)keyHighlightBackground {
    EbonyKeyView* key = [[EbonyKeyView alloc] initWithImage:keyBackground];
    [key setIntId:keyIndex];
    
    [keys addObject:key];
    
    CGRect keyFrame = CGRectZero;
    if (doubleEbonySize) {
        keyFrame.size.width = ebonyWidth*2;
    } else {
        keyFrame.size.width = ebonyWidth;
    }
    keyFrame.size.height = self.frame.size.height * EBONY_KEY_HEIGHT;
    keyFrame.origin.x = ivoryWidth*ivoryIndex - (ebonyWidth /2);
    [key setFrame:keyFrame];
    
    [key setHighlightedImage:keyHighlightBackground];
    
    [key setHighlighted:NO];
    [key setUserInteractionEnabled:NO];
    
    [self addSubview:key];
}

- (void) internalInit {
    [self setDoubleEbonySize:NO];
    [self setDelegate:nil];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"keyboardLayout" ofType:@"plist"];
    [self setKeyNames:[NSArray arrayWithContentsOfFile:plistPath]];
    
    [self setKeys:[NSMutableArray arrayWithCapacity:88]];
    [self setVisibleKeyRange:INITIAL_KEY_RANGE];
}

- (void) removeAllKeysFromView {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [[self keys] removeAllObjects];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self removeAllKeysFromView];
    
    NSUInteger keyNameOffset = [self convertToKeynameOffset: visibleKeyRange.location];
    // Load Keys
    float ivoryWidth = self.frame.size.width/visibleKeyRange.length;
    
    UIImage* ivoryKeyBackground = [UIImage imageNamed:@"ivory_keyup2.png"];
    UIImage* ivoryKeyHighlightBackground = [UIImage imageNamed:@"ivory_keydown2.png"];
    
    UIImage* ebonyKeyBackground = [UIImage imageNamed:@"ebony_keyup2.png"];
    UIImage* ebonyKeyHighlightBackground = [UIImage imageNamed:@"ebony_keydown2.png"];
    
    // Special case first ebony key
    NSString* keyName = nil;
    if (keyNameOffset > 0) {
        keyName = keyNames[(keyNameOffset-1)];
        if ([keyName hasSuffix:@"s"]) {
            [self addEbonyKey:keyNameOffset-1 ivoryIndex:0 ivoryWidth:ivoryWidth * EBONY_KEY_WIDTH ebonyWidth:EBONY_KEY_WIDTH keyBackground:ebonyKeyBackground keyHighlightBackground:ebonyKeyHighlightBackground];
        }
    }
    
    // Layout rest of keys in range
    NSInteger currentIvoryCount = 0;
    NSInteger currentKeyCount = 0;
    for (; currentIvoryCount < visibleKeyRange.length && (keyNameOffset + currentKeyCount) < [keyNames count]; currentKeyCount++) {
        NSInteger index = (keyNameOffset + currentKeyCount);
        keyName = keyNames[(keyNameOffset + currentKeyCount)];
        
        if ([keyName hasSuffix:@"s"]) {
            [self addEbonyKey:index ivoryIndex:currentIvoryCount ivoryWidth:ivoryWidth * EBONY_KEY_WIDTH ebonyWidth:EBONY_KEY_WIDTH keyBackground:ebonyKeyBackground keyHighlightBackground:ebonyKeyHighlightBackground];
            
        } else {
            [self addIvoryKey:index ivoryIndex:currentIvoryCount ivoryWidth:ivoryWidth keyBackground:ivoryKeyBackground keyHighlightBackground:ivoryKeyHighlightBackground title:keyName];
            
            currentIvoryCount++;
        }
    }
    
    // Special case possible last ebony key
    NSInteger nextKeyIndex = (keyNameOffset+currentKeyCount);
    if (nextKeyIndex < [keyNames count]) {
        keyName = keyNames[nextKeyIndex];
        if ([keyName hasSuffix:@"s"]) {
            [self addEbonyKey:nextKeyIndex ivoryIndex:currentIvoryCount ivoryWidth:ivoryWidth * EBONY_KEY_WIDTH ebonyWidth:EBONY_KEY_WIDTH keyBackground:ebonyKeyBackground keyHighlightBackground:ebonyKeyHighlightBackground];
        }
    }
    
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

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSSet* allTouches = [touches setByAddingObjectsFromSet:[event touchesForView:self]];
    
    NSMutableSet* pressedKeys = [NSMutableSet setWithCapacity:0];

    for (int keyIndex = 0; keyIndex < [keys count]; keyIndex++) {
        KeyBase* key = keys[keyIndex];
        BOOL keyIsPressed = NO;
        for (UITouch* touch in allTouches) {
            CGPoint location = [touch locationInView:self];
            if(CGRectContainsPoint(key.frame, location)) 
            {
                BOOL ignore = NO;
                
                if ([key isKindOfClass:[IvoryKeyView class]]) {
                    if (keyIndex > 0) {
                        UIImageView* previousKey = keys[keyIndex-1];
                        
                        if([previousKey isKindOfClass:[EbonyKeyView class]] && CGRectContainsPoint([previousKey frame], location)) {
                            ignore = YES;
                        }
                    }
                    
                    if (keyIndex < [keys count]-1) {
                        
                        UIImageView* nextKey = keys[keyIndex+1];
                        if ([nextKey isKindOfClass:[EbonyKeyView class]]) {
                            if(CGRectContainsPoint([nextKey frame], location)) {
                                ignore = YES;
                            }
                        }
                    }
                }
                
                if (ignore == NO) {
                    keyIsPressed = YES;
                    if (!key.isHighlighted){
                        [key setHighlighted:YES];
                        
                        if (delegate != nil) {
                            [pressedKeys addObject:[key keyId]];
                        }
                    }
                }
            }
        }
        
        if (keyIsPressed == NO && key.isHighlighted == YES) {
            [key setHighlighted:NO];
        }
    }
    
    if (delegate != nil && [pressedKeys count] > 0) {
        [delegate keysPressed:pressedKeys];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [touches setByAddingObjectsFromSet:[event touchesForView:self]];
    
    int i = 0;
    for (UIImageView* key in keys) {
        for (UITouch* touch in allTouches) {
            CGPoint location = [touch locationInView:self];
            if(CGRectContainsPoint(key.frame, location)) 
            {
                if ([touch phase] == UITouchPhaseEnded || [touch phase] == UITouchPhaseCancelled) {
                    [key setHighlighted:NO];
                } else {
                    NSLog(@"Unhandled touch phase: %@", @([touch phase]) );
                }
            }
        }
        
        i++;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"############ TODO: handles keyboard::touchesCancelled");
}

@end
