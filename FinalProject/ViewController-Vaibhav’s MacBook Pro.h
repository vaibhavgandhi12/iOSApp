//
//  ViewController.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@protocol ViewControllerDelegate <NSObject>

- (void) userIsLoggedIn;

@end

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    //Image and its animation
    UIImageView *logo;
    int counter;
    NSTimer *timer;
    
    //Spinning wheel
    UIActivityIndicatorView *spinner;
    
    //Login items
    UITextField *username;
    UITextField *password;
    UIButton *submit;
    
    //Data
    NSString *plistPath;
    NSMutableDictionary *dict;
    
    //AutoLogin
    NSUserDefaults *user;
    BOOL remember_login;
}

@property (assign, nonatomic) id<ViewControllerDelegate> delegate;

@end
