//
//  MusicNotesViewController.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/11/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "MusicNotesViewController.h"

#import "MusicStaffView.h"

@implementation MusicNotesViewController


@synthesize audio;
@synthesize keyboardView;

@synthesize startLocation;
//@synthesize wholeNote;
@synthesize drawingView;
@synthesize octaveSelectionView;



- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    if (!(self = [super initWithNibName:nibName bundle:nibBundle])) return nil;
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [keyboardView setVisibleKeyRange: NSMakeRange(48, 5)];
    
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
    [[self octaveSelectionView] setDelegate:self];
    
    
}

- (void) keysPressed:(NSSet *)keys {
    NSLog(@"keysPressed=%d", [keys count]);
    
    [drawingView addNotes:keys];
    
    for (NSNumber* keyIndex in keys) {
        if ([audio count] > [keyIndex intValue]) {
            SystemSoundID soundID = [audio[[keyIndex intValue]] unsignedLongValue];
            AudioServicesPlaySystemSound(soundID);
        }
    }
}

- (void) rangeChanged: (NSRange) newRange {
    NSLog(@"Got new range %d, %d", newRange.location, newRange.length);
    [keyboardView setVisibleKeyRange:newRange];
    [keyboardView setNeedsLayout];
}

@end
