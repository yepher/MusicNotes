//
//  StaffDrawingView.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/21/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StaffDrawingView : UIView {
    float spacing;
    CGRect trebleCleffFrame;
    CGRect bassCleffFrame;
    
    UIImageView* grandStaffBrace;
    
    UIImageView* trebleCleffSymbol;
    UIImageView* bassCleffSymbol;
    
}

@property (nonatomic, readonly) float spacing;
@property (nonatomic, readonly) CGRect trebleCleffFrame;
@property (nonatomic, readonly) CGRect bassCleffFrame;

@property (nonatomic, strong) UIImageView* grandStaffBrace;
@property (nonatomic, strong) UIImageView* trebleCleffSymbol;
@property (nonatomic, strong) UIImageView* bassCleffSymbol;

-(float) getNoteYLocation:(int) keyNumber;

@end
