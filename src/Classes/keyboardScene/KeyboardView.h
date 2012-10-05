//
//  KeyboardView.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/16/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyboardViewDelegate
- (void) keysPressed:(NSSet*) keys;
@end

#define IVORY_KEY_TOTAL 52
#define EBONY_KEY_TOTAL  36

#define INITIAL_KEY_RANGE NSMakeRange(16, 15)

#define EBONY_KEY_WIDTH .5
#define EBONY_KEY_HEIGHT .5



@interface KeyboardView : UIView {
    BOOL doubleEbonySize;
    id <KeyboardViewDelegate> delegate;
    
    NSRange visibleKeyRange;
    
    NSArray* keyNames;
    NSMutableArray* keys;

}

@property (nonatomic) BOOL doubleEbonySize;
@property (nonatomic, strong) id <KeyboardViewDelegate> delegate;
@property (nonatomic) NSRange visibleKeyRange;

@property (nonatomic, strong) NSArray* keyNames;
@property (nonatomic, strong) NSMutableArray* keys;

@end
