    //
//  MusicNotesViewController_Pad.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/15/11.
//  Copyright 2011 Yepher.com All rights reserved.
//
/**
 TODO:
 - Help mode with color notes and keys
 
**/

#import "MusicNotesViewController_Pad.h"

#import "MusicStaffView.h"

@implementation MusicNotesViewController_Pad

@synthesize audio;
@synthesize keyboardView;

@synthesize startLocation;
//@synthesize wholeNote;
@synthesize drawingView;
@synthesize octaveSelectionView;

@synthesize gameController;


- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    if (!(self = [super initWithNibName:nibName bundle:nibBundle])) return nil;
    return self;
}

//- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    [[self drawingView] setNeedsLayout];
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    //[self setBackGround:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]] autorelease]];
    //CGRect viewFrame = self.view.frame;
    //viewFrame.origin.x = 0;
    //viewFrame.origin.y = 0;
    //[backGround setFrame:viewFrame];
    //[[self view] addSubview:backGround];
    //x[[self view] sendSubviewToBack:backGround];
    //[backGround sizeToFit];
    
    
    if (audio == nil) {
        [self setAudio:[NSMutableArray arrayWithCapacity:0]];
    }
    
    [drawingView setShowOutsideLedger:YES];
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"keyboardLayout" ofType:@"plist"];
    NSArray* names = [NSArray arrayWithContentsOfFile:plistPath];
    
    // Load Audio
    for (int i = 0; i < [names count]; i++) {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:names[i] ofType:@"aif"]], &soundID);  
        NSNumber* audioId = @(soundID);
        [audio addObject:audioId];
    }
    
    [[self keyboardView] setDelegate:self];
    [keyboardView setDoubleEbonySize:YES];
    [[self octaveSelectionView] setDelegate:self];
    
    [self setGameController:[[GameController alloc] init]];
    [gameController setDelegate:self];

}

- (void) viewDidAppear:(BOOL)animated {
    [gameController startGame];

}

- (void) viewDidDisappear:(BOOL)animated {
    [gameController stopGame];
}

- (void) keysPressed:(NSSet *)keys {
    NSLog(@"keysPressed=%d", [keys count]);
    
    [gameController keysPressed:keys];
    
    [drawingView addNotes:keys];
    
    for (NSNumber* keyIndex in keys) {
        if ([audio count] > [keyIndex intValue]) {
            SystemSoundID soundID = [audio[[keyIndex intValue]] unsignedLongValue];
            // Should probably use "AudioServicesAddSystemSoundCompletion" to make 
            // sure we are never playing too many sounds at any one time.
            AudioServicesPlaySystemSound(soundID);
        }
    }
}

- (void) rangeChanged: (NSRange) newRange {
    NSLog(@"Got new range %d, %d", newRange.location, newRange.length);
    [keyboardView setVisibleKeyRange:newRange];
    [keyboardView setNeedsLayout];
}


- (void) gameStarted {
    [drawingView clearNotes];
}

- (void) gameEnded {
    
}

- (void) gamePresentKeys:(NSSet*) notes {
    NSLog(@"TODO: gamePresentKeys");
    [drawingView addNotes:notes];
    
}

- (void) gameQuestionAnsweredCorrectly {
    [drawingView clearNotes];
}

@end
