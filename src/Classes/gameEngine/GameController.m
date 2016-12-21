//
//  GameController.m
//  MusicNotes
//
//  Created by Christopher Wilson on 1/23/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import "GameController.h"


@implementation GameController

@synthesize questionIndex;
@synthesize delegate;
@synthesize currentQuestion;

// 00| C - No Sharps or Flats
// 01| G - F#
// 02| D - F# C#
// 03| A - F# C# G#
// 04| E - F# C# G# D#
// 05| B - F# C# G# D# A#      AKA     Cb - Bb Eb Ab Db Cb Fb
// 06| F# - F# C# G# D# A# E#  AKA     Gb - Bb Eb Ab Db Cb Gb
// 07| Db - Bb Eb Ab Db Gb     AKA     C# - F# C# G# D# A# E# B#
// 08| Ab - Bb Eb Ab Db
// 09| Eb - Bb Eb Ab
// 10| Bb - Bb Eb
// 11| F - Bb


- (NSSet*) nextQuestion {
    NSLog(@"Correct Answer!!!");
    
    // Need to sort out the real way of generating the list of keys to use.
    int aKeys[] = {3, 5, 7, 8, 10, 12, 14 };
    int keyLen = 7;
    NSNumber* key = @(aKeys[questionIndex%keyLen]);
    
    NSSet* keys = [NSSet setWithObject:key];
    
    self.currentQuestion = keys;
    if (delegate != nil) {
        [delegate gamePresentKeys:keys];
    }
    
    questionIndex++;
    
    return keys;
    
}

- (void) startGame {
    NSLog(@"startGame");

    if (delegate != nil) {
        [self.delegate gameStarted];
        [self nextQuestion];
    } else {
        NSLog(@"Cannot start game without a game delegate.");
        NSAssert(NO, @"Cannot start game without a game delegate.");
    }

}

- (void) keysPressed:(NSSet *)keys {
    NSLog(@"GAME: keysPressed=%@", @(keys.count));
    
    if (currentQuestion != nil) {
        if (keys.count != currentQuestion.count) {
            // TODO: Incorrect Answer
            NSLog(@"GAME: Wrong number of keys pressed");
            return;
        }
        
        for (NSNumber* key in keys) {
            if ([currentQuestion containsObject:key] == NO) {
                // TODO: Incorrect Answer
                NSLog(@"GAME: incorrect key pressed %@", key);
                return;
            }
        }
        
        if (delegate != nil) {
            [self.delegate gameQuestionAnsweredCorrectly];
            [self nextQuestion];
        } 
    }
}    

- (void) stopGame {
    NSLog(@"stopGame");
    
    [self setCurrentQuestion:nil];
    if (delegate != nil) {
        [self.delegate gameEnded];
    }
}



@end
