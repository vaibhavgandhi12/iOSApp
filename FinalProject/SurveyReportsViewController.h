//
//  SurveyReportsViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData.h"
#import "Entity.h"

@interface SurveyReportsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *surveys;
    UITableView *table;
    
    CoreData *coreData;
    
    bool auto_refresh;
   
    int flag;
}

- (instancetype) initWithCoreData: (CoreData *) core;

@end