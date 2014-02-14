//
//  CustomScrollView.m
//  iOSTopics
//
//  Created by Vaibhav Gandhi on 1/10/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

@synthesize customizedDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) touchesBegan :(NSSet *) touches withEvent : (UIEvent *) event
{
    NSLog(@"Custom Touches began");
    if(customizedDelegate != nil)
    {
        [customizedDelegate onTouchBegan:touches withEvent:event];
    }
}

- (void) touchesEnded :(NSSet *) touches withEvent : (UIEvent *) event
{
    NSLog(@"Custom Touches ended");
    if(customizedDelegate != nil)
    {
        [customizedDelegate onTouchEnded:touches withEvent:event];
    }
}

@end
