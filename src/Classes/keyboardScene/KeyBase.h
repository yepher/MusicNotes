//
//  KeyBase.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/19/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KeyBase : UIImageView {
    UILabel* label;
    
    BOOL helpColorHidden;
    
    BOOL helpTextHidden;
    
    NSNumber* keyId;
}

@property (nonatomic, strong) UILabel* label;

@property (nonatomic) BOOL helpColorHidden;

@property (nonatomic) BOOL helpTextHidden;

@property (nonatomic, strong) NSNumber* keyId;


- (void) setIntId: (int) intKeyId;
+ (UIColor*) colorForNote: (unichar) note;

@end
