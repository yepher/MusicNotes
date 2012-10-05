//
//  MusicNotesAppDelegate.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/11/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicNotesViewController_Pad;

@interface MusicNotesAppDelegate_Pad : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MusicNotesViewController_Pad* viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet MusicNotesViewController_Pad* viewController;

@end

