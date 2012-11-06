//
//  RATBVSAppDelegate.m
//  RATilingBackgroundViewSample
//
//  Created by Evadne Wu on 11/6/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RATBVSAppDelegate.h"
#import "RATBVSMainViewController.h"

@interface RATBVSAppDelegate ()
@property (nonatomic, readonly, strong) UITapGestureRecognizer *doubleTapGestureRecognizer;
@end

@implementation RATBVSAppDelegate
@synthesize doubleTapGestureRecognizer = _doubleTapGestureRecognizer;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_window.backgroundColor = [UIColor whiteColor];
	_window.rootViewController = [RATBVSMainViewController new];
	
	[_window addGestureRecognizer:self.doubleTapGestureRecognizer];
	[_window makeKeyAndVisible];
	
	return YES;
	
}

- (UITapGestureRecognizer *) doubleTapGestureRecognizer {

	//	This is mostly for debugging only
	
	if (!_doubleTapGestureRecognizer) {
	
		_doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
		_doubleTapGestureRecognizer.numberOfTapsRequired = 2;
	
	}
	
	return _doubleTapGestureRecognizer;

}

- (void) handleDoubleTap:(UITapGestureRecognizer *)tapGR {

	NSCParameterAssert(tapGR == _doubleTapGestureRecognizer);
	
	UIWindow *window = self.window;
	
	[UIWindow animateWithDuration:0.25f delay:0.0f options:UIViewAnimationOptionAllowAnimatedContent|UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
		
		if (CGAffineTransformIsIdentity(window.transform)) {
		
			window.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
		
		} else {
		
			window.transform = CGAffineTransformIdentity;
			
		}

	} completion:^(BOOL finished) {
	
		//	?
		
	}];	

}

@end
