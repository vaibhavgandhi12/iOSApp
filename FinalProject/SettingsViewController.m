//
//  SettingsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype) init
{
    if([super init])
    {
        self.view.backgroundColor = [UIColor whiteColor];
        
        user = [NSUserDefaults standardUserDefaults];
        user1 = [user stringForKey:@"username"];
        pass1 = [user stringForKey:@"password"];
        remember_login = [user boolForKey:@"remember_login"];
        auto_refresh = [user boolForKey:@"auto_refresh"];
        
        [self createView];
    }
    return self;
}

- (void) createView
{
    UILabel *uname = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 100.0, 170.0, 20.0)];
    uname.text = @"Username";
    [self.view addSubview:uname];
    
    UILabel *pwd = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 130.0, 170.0, 20.0)];
    pwd.text = @"Password";
    [self.view addSubview:pwd];

    username = [[UITextField alloc] initWithFrame:CGRectMake(180.0, 100.0, 100.0, 20.0)];
    password = [[UITextField alloc] initWithFrame:CGRectMake(180.0, 130.0, 100.0, 20.0)];
    
    username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:user1 attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:pass1 attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    [self.view addSubview:username];
    [self.view addSubview:password];
    
    UILabel *loginSwitch = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 160.0, 170.0, 20.0)];
    loginSwitch.text = @"Remember Login";
    [self.view addSubview:loginSwitch];
    
    UISwitch *login = [[UISwitch alloc] initWithFrame:CGRectMake(180.0, 160.0, 0.0, 0.0)];
    login.on = remember_login;
    [login addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:login];
    
    UILabel *refreshSwitch = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 190.0, 170.0, 20.0)];
    refreshSwitch.text = @"Auto Refresh";
    [self.view addSubview:refreshSwitch];
    
    UISwitch *refresh = [[UISwitch alloc] initWithFrame:CGRectMake(180.0, 190.0, 0.0, 0.0)];
    refresh.on = auto_refresh;
    [refresh addTarget:self action:@selector(changeRefreshSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:refresh];
}

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        [user setObject:username.text forKey:@"username"];
        [user setObject:password.text forKey:@"password"];
        [user setBool:true forKey:@"remember_login"];
        NSLog(@"Switch is ON");
    } else{
        [user setObject:@"" forKey:@"username"];
        [user setObject:@"" forKey:@"password"];
        [user setBool:false forKey:@"remember_login"];
        NSLog(@"Switch is OFF");
    }
}

- (void)changeRefreshSwitch:(id)sender{
    if([sender isOn]){
        [user setBool:true forKey:@"auto_refresh"];
        NSLog(@"Switch is ON");
    } else{
        [user setBool:false forKey:@"auto_refresh"];
        NSLog(@"Switch is OFF");
    }
}

- (BOOL) isRememberLogin
{
    return remember_login;
}

@end
