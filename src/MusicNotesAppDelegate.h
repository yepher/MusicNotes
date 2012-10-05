//
//  MusicNotesAppDelegate.h
//  MusicNotes
//
//  Created by Christopher Wilson on 1/11/11.
//  Copyright 2011 Yepher.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicNotesViewController;

@interface MusicNotesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MusicNotesViewController* viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet MusicNotesViewController* viewController;

@end

