//
//  DetailedContactsViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#include "Contact.h"

@interface DetailedContactsViewController : UIViewController <ABUnknownPersonViewControllerDelegate, UITextFieldDelegate>
{
    Contact *tempC;
}

- (instancetype) initWithContact:(Contact *) temp;

@end
