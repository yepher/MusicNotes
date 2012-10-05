//
//  MusicNotesViewController.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/11/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

#import "OctaveRangeSelectionView.h"
#import "KeyboardView.h"

@class MusicStaffView;

@interface MusicNotesViewController : UIViewController <KeyboardViewDelegate, OctaveRangeDelegate> {
    NSMutableArray* audio;
    
    IBOutlet KeyboardView* keyboardView;
    
    CGPoint startLocation;
    
//    UIImageView* wholeNote;
    IBOutlet MusicStaffView* drawingView;
    IBOutlet OctaveRangeSelectionView* octaveSelectionView;
        
}

@property (nonatomic, strong) NSMutableArray* audio;
@property (nonatomic, strong) KeyboardView* keyboardView;

@property (nonatomic) CGPoint startLocation;
//@property (nonatomic, retain) UIImageView* wholeNote;
@property (nonatomic, strong) MusicStaffView* drawingView;
@property (nonatomic, strong) IBOutlet OctaveRangeSelectionView* octaveSelectionView;

@end

