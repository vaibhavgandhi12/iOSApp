//
//  ConsumerSurveyViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"

@interface ConsumerSurveyViewController : UIViewController <UITextFieldDelegate, CustomScrollViewDelegate>
{
    UIScrollView *scrollView;
    NSArray *arrayOfScrolls;
    NSString *plistPath;
}

@end
