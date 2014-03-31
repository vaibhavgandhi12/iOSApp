//
//  ConsumerSurveyViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData.h"
#import "Entity.h"

@protocol ConsumerSurveyViewDelegate <NSObject>

- (void) changeToListPDFs;

@end

@interface ConsumerSurveyViewController : UIViewController <UITextFieldDelegate>
{
    UIScrollView *scrollView;
    NSArray *arrayOfScrolls, *info;
    NSString *plistPath;
    CoreData *coreData;
}

- (instancetype) initWithCoreData:(CoreData *) core;

@property (assign, nonatomic) id<ConsumerSurveyViewDelegate> delegate;

@end
