//
//  DetailedSurveyViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <QuickLook/QuickLook.h>
#import "CoreData.h"
#import "Entity1.h"

@interface DetailedSurveyViewController : UIViewController <UIDocumentInteractionControllerDelegate>
{
    NSString *data, *pdfFile, *dateID;
    UIDocumentInteractionController *doInteractionController;
    NSString *printableData;
    CoreData *coreData;
}

- (instancetype) initWithEntity:(Entity1 *) source initWithCoreData:(CoreData *) core;

@end
