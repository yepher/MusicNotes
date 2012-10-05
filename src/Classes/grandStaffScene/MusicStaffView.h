//
//  MusicStaffView.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/13/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class StaffDrawingView;

@interface MusicStaffView : UIView {
    NSMutableArray* noteViewCache;
    
    NSMutableArray* scoreNotes;
    NSMutableArray* notes;
    
    StaffDrawingView* staffDrawingView;
    UIImageView* trebleClef;
    UISlider* noteSlider;
    
    int currentNote;
    
    int key;
    BOOL showOutsideLedger;
}

@property (nonatomic, strong) NSMutableArray* noteViewCache;
@property (nonatomic, strong) NSMutableArray* scoreNotes;
@property (nonatomic, strong) NSMutableArray* notes;
@property (nonatomic, strong) StaffDrawingView* staffDrawingView;
@property (nonatomic, strong) UIImageView* trebleClef;
@property (nonatomic, strong) UISlider* noteSlider;

@property (nonatomic) int key;
@property (nonatomic) BOOL showOutsideLedger;

- (void) addNotes: (NSSet*) notes;
- (void) displayNote: (int) keyNumber;
- (void) clearNotes;

@end
