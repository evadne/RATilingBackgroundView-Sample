//
//  RATBVSMainViewController.m
//  RATilingBackgroundViewSample
//
//  Created by Evadne Wu on 11/6/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RATBVSMainViewController.h"
#import "RATilingBackgroundView.h"

@interface RATBVSMainViewController () <RATilingBackgroundViewDelegate, UIScrollViewDelegate>
@property (nonatomic, readonly, weak) RATilingBackgroundView *tilingBackgroundView;
@end

@implementation RATBVSMainViewController
@synthesize tilingBackgroundView = _tilingBackgroundView;

- (void) viewDidLoad {
	
	[super viewDidLoad];
	
	self.scrollView.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.5f].CGColor;
	self.scrollView.layer.borderWidth = 2.0f;
	
	self.scrollView.contentSize = (CGSize){
		CGRectGetWidth(self.scrollView.frame),
		65536.0f
	};
	
	[self.scrollView addSubview:self.tilingBackgroundView];
	
}

- (void) viewWillLayoutSubviews {

	[super viewWillLayoutSubviews];
	
	self.tilingBackgroundView.frame = self.scrollView.bounds;
	
}

- (RATilingBackgroundView *) tilingBackgroundView {

	if (_tilingBackgroundView)
		return _tilingBackgroundView;
	
	if ([self isViewLoaded]) {
		RATilingBackgroundView *tilingBackgroundView = [RATilingBackgroundView new];
		tilingBackgroundView.delegate = self;
		tilingBackgroundView.layer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:0.5f].CGColor;
		tilingBackgroundView.layer.borderWidth = 8.0f;
		[self.scrollView addSubview:tilingBackgroundView];
		_tilingBackgroundView = tilingBackgroundView;
	}
	
	return _tilingBackgroundView;

}

- (CGSize) sizeForTilesInTilingBackgroundView:(RATilingBackgroundView *)tilingBackgroundView {

	return (CGSize){ 256, 256 };

}

- (UIView *) newTileForTilingBackgroundView:(RATilingBackgroundView *)tilingBackgroundView {

	UIView *view = [[UIView alloc] initWithFrame:(CGRect){
		.size = [self sizeForTilesInTilingBackgroundView:tilingBackgroundView]
	}];
	
	CGFloat red = (arc4random() % 256) / 256.0f;
	CGFloat green = (arc4random() % 256) / 256.0f;
	CGFloat blue = (arc4random() % 256) / 256.0f;

	view.layer.borderColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
	view.layer.borderWidth = 16.0f;
	
	return view;

}

@end
