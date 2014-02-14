//
//  CoreData.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Entity.h"
#import "Entity1.h"
#import "PDF.h"

@interface CoreData : NSObject
{
    NSManagedObjectModel *managedObjectModel; //Database schema
    NSManagedObjectContext *managedObjectContext; //Database connection
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void) addSurvey: (NSArray *)info;
- (NSMutableArray *) fetchSurveys;
- (void) addPDF: (NSString *)info;
- (NSMutableArray *) fetchPDFs;

@end
