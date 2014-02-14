//
//  ListPDFsViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <QuickLook/QuickLook.h>
#import <UIKit/UIKit.h>
#import "CoreData.h"

@interface ListPDFsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIDocumentInteractionControllerDelegate>
{
    UITableView *table;
    NSMutableArray *listPDFs;
    CoreData *coreData;
    int flag;
    UIDocumentInteractionController *doInteractionController;
}

- (instancetype) initWithCoreData:(CoreData *)core;

@end
