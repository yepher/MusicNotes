//
//  KeyBase.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/19/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "KeyBase.h"


@implementation KeyBase

static UIColor* aColor = nil;
static UIColor* bColor = nil;
static UIColor* cColor = nil;
static UIColor* dColor = nil;
static UIColor* eColor = nil;
static UIColor* fColor = nil;
static UIColor* gColor = nil;

@synthesize label;
@synthesize helpColorHidden;
@synthesize helpTextHidden;
@synthesize keyId;



+ (void)initialize {
    [super initialize];
    if (!aColor) {
        aColor = HEXCOLOR(0xFFFF0055);
    }
    
    if (!bColor) {
        bColor = HEXCOLOR(0xFFCC3355);
    }
    
    if (!cColor) {
        cColor = HEXCOLOR(0xFFFFFF55);
    }
        
    if (!dColor) {    
        dColor = HEXCOLOR(0x99FF3355);
    }
        
    if (!eColor) {    
        eColor = HEXCOLOR(0x6699FF55);
    }
        
    if (!fColor) {    
        fColor = HEXCOLOR(0xFF99FF55);
    }
        
    if (!gColor) {    
        gColor = HEXCOLOR(0xFF000055);
    }
}

- (void) internalBaseInit {
    [self setLabel:[[UILabel alloc] init]];
    helpTextHidden = NO;
    helpColorHidden = NO;
}

+ (UIColor*) colorForNote: (unichar) note {
    
    switch(note) {
        case 'A':
            return aColor;
        case 'B':
            return bColor;
        case 'C':
            return cColor;
        case 'D':
            return dColor;
        case 'E':
            return eColor;
        case 'F':
            return fColor;
        case 'G':
            return gColor;
        default:
            NSLog(@"Unknow Note Color: %c", note);
            return [UIColor blackColor];
    }
    
    NSLog(@"Unknow Note Color: %c", note);
    return nil;
}

- (void)layoutSubviews {
    CGRect labelFrame = CGRectZero;
    labelFrame.size.width = (self.frame.size.width*.65);
    labelFrame.size.height = (self.frame.size.width/2);
    labelFrame.origin.y = self.frame.size.height - (labelFrame.size.height*1.5);
    labelFrame.origin.x = (self.frame.size.width - labelFrame.size.width)/2;

    [label setFrame:labelFrame];
    [label setTextAlignment:UITextAlignmentCenter];
    [self addSubview:label];
    [self bringSubviewToFront:label];

    //NSLog(@"label width = %f", labelFrame.size.width);
    // round corners if label is not too small.
    if (labelFrame.size.width > 30) {
        label.layer.cornerRadius = 10.0;
    }
    
    if (helpColorHidden) {
        [label setHidden:YES];
    } else {
        [label setHidden:NO];
        if ([label text] != nil) {
            unichar note = [[label text] characterAtIndex:1];
            [label setBackgroundColor:[KeyBase colorForNote:note]];
        }
    }
    
    if (helpTextHidden) {
        [label setTextColor:[UIColor clearColor]];
    } else {
        [label setTextColor:[UIColor blackColor]];
    }
    
    [label setAdjustsFontSizeToFitWidth:YES];
}

- (id) initWithCoder:(NSCoder *)aCoder {
    if( self = [super initWithCoder:aCoder]){
        //[self initialize];
    }
    return self;
}

- (id) initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect]){
        //[self initialize];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image {
    if(self = [super initWithImage:image]){
        [self internalBaseInit];
    }
    return self;
}

- (void) setIntId: (int) intKeyId {
    [self setKeyId:@(intKeyId)];
}

@end
