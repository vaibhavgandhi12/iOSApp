//
//  ContactsViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "DetailedContactsViewController.h"
#import "XMLParser.h"

@interface ContactsViewController : UIViewController <XMLParserDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *dataArray;
    XMLParser *parser;
    UITableView *dataTable;
}

@end
