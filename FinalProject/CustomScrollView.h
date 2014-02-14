//
//  CustomScrollView.h
//  iOSTopics
//
//  Created by Vaibhav Gandhi on 1/10/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomScrollViewDelegate

- (void) onTouchBegan :(NSSet *) touches withEvent : (UIEvent *) event;
- (void) onTouchEnded :(NSSet *) touches withEvent : (UIEvent *) event;

@end

@interface CustomScrollView : UIScrollView

@property (assign, nonatomic) id <CustomScrollViewDelegate> customizedDelegate;

@end
