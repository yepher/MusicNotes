//
//  NoteView.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/23/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "NoteView.h"
#import "KeyBase.h"
#import "FlatSymbol.h"

@implementation NoteView

@synthesize keyNumber;
@synthesize noteImage;


-(void) internalInit {
    
}

- (instancetype) init {
    if( self = [super init]){
        [self internalInit];
    }
    return self;
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

- (void)layoutSubviews {
    [super layoutSubviews];
   
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"keyboardLayout" ofType:@"plist"];
    NSArray* names = [NSArray arrayWithContentsOfFile:plistPath];
    NSString* keyInfo = names[keyNumber];
    
    // TODO: handle case with flats in key signature...
    if (noteImage == nil) {
        if ([keyInfo hasSuffix:@"s"]) {
            [self setNoteImage:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wholeNote_sharp.png"]]];
        } else {
            [self setNoteImage:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wholeNote.png"]]];

        }

        [self addSubview:noteImage];
        CGRect noteFrame = self.frame;
        noteFrame.origin.x = 0;
        noteFrame.origin.y = 0;
        [noteImage setFrame:noteFrame];
        //
//        FlatSymbol* flatSymbol = [[[FlatSymbol alloc] init] autorelease];
//        [flatSymbol setFrame:noteFrame];
//        [self addSubview:flatSymbol];
    }
    
    unichar note = [keyInfo characterAtIndex:1];
    [noteImage setBackgroundColor:[KeyBase colorForNote:note]];
}


@end
