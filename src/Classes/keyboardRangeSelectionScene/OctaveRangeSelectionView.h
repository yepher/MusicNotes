//
//  OctaveRangeSelectionView.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/19/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OctaveRangeDelegate
- (void) rangeChanged: (NSRange) newRange;
@end

IB_DESIGNABLE
@interface OctaveRangeSelectionView : UIView {
    id <OctaveRangeDelegate> delegate;
    
    CGPoint startLocation;
    CGFloat initialDistance;
    CGFloat previousDistance;
    
    UIImageView* keyboadBackground;
    UIImageView* maskView;
    
}

@property (nonatomic, strong) id <OctaveRangeDelegate> delegate;
@property (nonatomic) CGPoint startLocation;
@property (nonatomic, strong) UIImageView* keyboadBackground;
@property (nonatomic, strong) UIImageView* maskView;

@end
