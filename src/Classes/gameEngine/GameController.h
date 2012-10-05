//
//  GameController.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/23/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameDelegate
- (void) gameStarted;
- (void) gameEnded;
- (void) gamePresentKeys:(NSSet*) notes;
- (void) gameQuestionAnsweredCorrectly;

@end

@interface GameController : NSObject {
    NSInteger questionIndex;
    
    id <GameDelegate> delegate;
    
    NSSet* currentQuestion;
}

@property (nonatomic) NSInteger questionIndex;
@property (nonatomic, strong) id <GameDelegate> delegate;
@property (nonatomic, strong) NSSet* currentQuestion;

- (void) startGame;
- (void) stopGame;

- (void) keysPressed:(NSSet *)keys;

@end
