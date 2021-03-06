//
//  AppDelegate.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData.h"
#import "ConsumerSurveyViewController.h"
#import "ListPDFsViewController.h"
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, ViewControllerDelegate, ConsumerSurveyViewDelegate>
{
    CoreData *coreData;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ListPDFsViewController *list;

@end