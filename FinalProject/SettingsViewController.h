//
//  SettingsViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    NSString *user1, *pass1;
    BOOL remember_login;
    BOOL auto_refresh;
    
    NSUserDefaults *user;
    
    UITextField *username, *password;
}

@end
