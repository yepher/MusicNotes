//
//  MusicNotesViewController_Pad.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/15/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

#import "OctaveRangeSelectionView.h"
#import "KeyboardView.h"
#import "GameController.h"

@class MusicStaffView;

@interface MusicNotesViewController_Pad : UIViewController <KeyboardViewDelegate, OctaveRangeDelegate, GameDelegate> {
    NSMutableArray* audio;
    
    IBOutlet KeyboardView* keyboardView;
    
    CGPoint startLocation;
    
    //UIImageView* wholeNote;
    IBOutlet MusicStaffView* drawingView;
    
    IBOutlet OctaveRangeSelectionView* octaveSelectionView;
    
    GameController* gameController;
    
}

@property (nonatomic, strong) NSMutableArray* audio;
@property (nonatomic, strong) KeyboardView* keyboardView;

@property (nonatomic) CGPoint startLocation;
//@property (nonatomic, retain) UIImageView* wholeNote;
@property (nonatomic, strong) MusicStaffView* drawingView;

@property (nonatomic, strong) OctaveRangeSelectionView* octaveSelectionView;

@property (nonatomic, strong) GameController* gameController;


@end