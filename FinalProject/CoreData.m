//
//  CoreData.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "CoreData.h"

@implementation CoreData

- (void) addSurvey: (NSArray *)info
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSError *error = nil;
    
    Entity *personInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:context];
    
    //personInfo.personid = [NSNumber numberWithInt:2];
    personInfo.name = [info objectAtIndex:0];
    personInfo.age = [info objectAtIndex:1];
    personInfo.gender = [info objectAtIndex:2];
    personInfo.email = [info objectAtIndex:3];
    personInfo.street = [info objectAtIndex:4];
    personInfo.city = [info objectAtIndex:5];
    personInfo.state = [info objectAtIndex:6];
    personInfo.country = [info objectAtIndex:7];
    personInfo.os = [info objectAtIndex:8];
    personInfo.date = [info objectAtIndex:9];
    personInfo.gadget = [info objectAtIndex:10];
    personInfo.cost = [info objectAtIndex:11];
    
    if (![context save:&error]) {
        NSLog(@"Whoops couldn't save %@", [error localizedDescription]);
    }
    
//    Test listing all inputs from the store
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
//    [fetchRequest setEntity:entity];
//    
//    NSArray *fetchedObject = [context executeFetchRequest:fetchRequest error:&error];
//    
//    for (Entity *temp in fetchedObject) {
//        NSLog(@"Name: %@", temp.name);
//    }
//    [fetchRequest release];
//    [context release];
}

- (NSMutableArray *) fetchSurveys
{
    //Test listing all inputs from the store
    NSMutableArray *surveys = [[NSMutableArray alloc] init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObject = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Entity *info in fetchedObject) {
        Entity1 *temp = [[Entity1 alloc] init];
        temp.name = info.name;
        temp.age = info.age;
        temp.gender = info.gender;
        temp.email = info.email;
        temp.street = info.street;
        temp.city = info.city;
        temp.state = info.state;
        temp.country = info.country;
        temp.os = info.os;
        temp.date = info.date;
        temp.gadget = info.gadget;
        temp.cost = info.cost;
        //NSLog(@"Name: %@", temp.name);
        [surveys addObject:temp];
    }
    
    return surveys;
    
    //[fetchRequest release];
    //[context release];
}

- (void) addPDF: (NSString *)info
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSError *error = nil;
    
    PDF *str = [NSEntityDescription insertNewObjectForEntityForName:@"PDF" inManagedObjectContext:context];
    
    str.pdfFile = info;

    if (![context save:&error]) {
        NSLog(@"Whoops couldn't save %@", [error localizedDescription]);
    }
    
    NSLog(@"Path: %@", str.pdfFile);
}

- (NSMutableArray *) fetchPDFs
{
    //Test listing all inputs from the store
    NSMutableArray *surveys = [[NSMutableArray alloc] init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PDF" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObject = [context executeFetchRequest:fetchRequest error:&error];
    
    for (PDF *info in fetchedObject) {
        NSString *temp = info.pdfFile;
        //NSLog(@"Name: %@", temp);
        [surveys addObject:temp];
    }
    
    return surveys;
}

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context didn't already exist, it is created and boudn to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model didn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *) managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    return managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"SurveyDB.sqlite"]];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with the code to handle the error appropriately.
         
         abort() causes the applcation to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert pane that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accesible
         * The schema for the persistent store is incompatible with current managed object model
         Check the error message to determine what the actual problem was.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //abort();
    }
    return persistentStoreCoordinator;
}

- (NSString *) applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
