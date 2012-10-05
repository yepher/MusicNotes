//
//  NoteView.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/23/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NoteView : UIView {
    NSInteger keyNumber;
    UIImageView* noteImage;
}

@property (nonatomic) NSInteger keyNumber;
@property (nonatomic, strong) UIImageView* noteImage;

@end
