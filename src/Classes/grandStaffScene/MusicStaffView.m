//
//  MusicStaffView.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/13/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "MusicStaffView.h"
#import "StaffDrawingView.h"
#import "NoteView.h"

#define NOTE_SPACING 30

@implementation MusicStaffView

@synthesize noteViewCache;
@synthesize scoreNotes;
@synthesize notes;

@synthesize staffDrawingView;
@synthesize trebleClef;
@synthesize noteSlider;

@synthesize key;
@synthesize showOutsideLedger;



-(void) internalInit {
    [self setScoreNotes:[NSMutableArray arrayWithCapacity:0]];
    CGRect drawingFrame = [self frame];
    drawingFrame.origin.x = 0;
    drawingFrame.origin.y = 0;
    
    [self setStaffDrawingView:[[StaffDrawingView alloc] initWithFrame:drawingFrame]];
    [self addSubview:staffDrawingView];
    
    [self setBackgroundColor:HEXCOLOR(0xF7F8E0FF)];
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
    NSLog(@"layoutSubviews w=%f h=%f", [self frame].size.width, [self frame].size.height);
    
    CGRect drawingFrame = [self frame];
    drawingFrame.origin.x = 0;
    drawingFrame.origin.y = 0;
    [self.staffDrawingView setFrame:drawingFrame];
}

- (void) addNotes: (NSSet*) newNotes {
    //if ([scoreNotes count] > 44) {
    if ( (([scoreNotes count]+4) * NOTE_SPACING) > staffDrawingView.frame.size.width) {
    
        [self clearNotes];
    }
    
//    while ([scoreNotes count] > 10) {
//        NSSet* notesSet = [scoreNotes objectAtIndex:0];
//        [scoreNotes removeObjectAtIndex:0];
//        
//        for (UIView* noteView in notesSet) {
//            
//            // TODO: this is not working
//            [noteView removeFromSuperview];
//            [noteViewCache addObject:noteView];
//        }
//    }
    
    NSMutableSet* noteSet = [[NSMutableSet alloc] initWithCapacity:[newNotes count]];
    [scoreNotes addObject:noteSet];
    
    for (NSNumber* keyNumber in newNotes) {
        NSLog(@"KeyNumber: %@", keyNumber);
        NoteView* noteView = nil;
        
//        if ([noteViewCache count] > 0) {
//            noteView = [noteViewCache objectAtIndex:0];
//            [noteViewCache removeObjectAtIndex:0];
//        }
        
        if (noteView == nil) {
            NSLog(@"ALLOC NEW NOTEVIEW");
            noteView = [[NoteView alloc] init];
        }
        
        [noteView setKeyNumber:[keyNumber intValue]];
        [self addSubview:noteView];
        CGRect noteFrame = [noteView frame];
        noteFrame.origin.x = staffDrawingView.trebleCleffFrame.origin.x + ([scoreNotes count] * NOTE_SPACING);
        noteFrame.origin.y = [staffDrawingView getNoteYLocation:[keyNumber intValue]];
        noteFrame.size.height = [staffDrawingView spacing];
        noteFrame.size.width = noteFrame.size.height*1.5;
        [noteView setFrame: noteFrame];
        
        [noteSet addObject:noteView];
    }
}

- (void) clearNotes {
//    [noteViewCache removeAllObjects];
    while([scoreNotes count] > 0) {
        NSSet* notesSet = scoreNotes[0];
        [scoreNotes removeObjectAtIndex:0];
        
        for (NoteView* noteView in notesSet) {
            [noteView removeFromSuperview];
        }
    }
}

- (void) displayNote: (NSInteger) keyNumber {
    NSLog(@"TODO: Engrave note: %@", @(keyNumber));
}

@end


