//
//  ViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) init
{
    self = [super init];
    if(self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
        dict = [[NSMutableDictionary alloc] init];
        [self createView];
    }
    return self;
}

- (void) createView
{
    CGRect rect = CGRectMake(110.0, 175.0, 100.0, 130.0);
    logo = [[UIImageView alloc] initWithFrame:rect];
    logo.image = [UIImage imageNamed:@"logo.png"];
    [self.view addSubview:logo];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.center = self.view.center;
    spinner.hidden = YES;
    [self.view addSubview:spinner];
    
    username = [[UITextField alloc] initWithFrame:CGRectMake(50.0, 250.0, 220.0, 30.0)];
    username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: [UIColor blueColor]}];
    username.textAlignment = NSTextAlignmentCenter;
    username.delegate = self;
    username.hidden = YES;
    [self.view addSubview:username];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(50.0, 290.0, 220.0, 30.0)];
    password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor blueColor]}];
    password.textAlignment = NSTextAlignmentCenter;
    password.delegate = self;
    password.secureTextEntry = YES;
    password.hidden = YES;
    [self.view addSubview:password];
    
    user = [NSUserDefaults standardUserDefaults];
    remember_login = [user boolForKey:@"remember_login"];
    bool user1 = false, pass1 = false;
    if (remember_login) {
        if ([user stringForKey:@"username"]) {
            username.text = [user stringForKey:@"username"];
            user1 = true;
        }
        if ([user stringForKey:@"password"]) {
            password.text = [user stringForKey:@"password"];
            pass1 = true;
        }
        if (user1 && pass1) {
            [self submitClicked];
        }
    }
    
    submit = [UIButton buttonWithType:UIButtonTypeSystem];
    submit.frame = CGRectMake(100.0, 330.0, 120.0, 30.0);
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventTouchDown];
    submit.hidden = YES;
    [self.view addSubview:submit];
    
    counter = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(animate) userInfo:Nil repeats:YES];
}

- (void) animate
{
    counter++;
    if (counter < 65) {
        if (counter == 5) {
            spinner.hidden = NO;
            [spinner startAnimating];
        }
        logo.frame = CGRectMake(110.0, 175 - counter, 100.0, 130.0);
    }
    
    else {
        [spinner stopAnimating];
        spinner.hidden = YES;
        logo.frame = CGRectMake(110.0, 110.0, 100.0, 130.0);
        
        //Make the login page appear
        username.hidden = NO;
        password.hidden = NO;
        submit.hidden = NO;
    }
}

#pragma mark - textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // keyboard is visible, move views
    CGRect myScreenRect = [[UIScreen mainScreen] bounds];
    int keyboardHeight = 216;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    int needToMove = 0;
    CGRect frame = self.view.frame;
    if (textField.frame.origin.y + textField.frame.size.height + self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height > (myScreenRect.size.height - keyboardHeight)) {
        needToMove = (textField.frame.origin.y + textField.frame.size.height + self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height) - (myScreenRect.size.height - keyboardHeight);
    }
    frame.origin.y =  -needToMove;
    [self.view setFrame:frame];
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // resign first responder, hide keyboard, move views
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
}

- (BOOL) textFieldShouldReturn : (UITextField *) textField
{
    if([username isFirstResponder])
    {
        [password becomeFirstResponder];
    }
    
    [textField resignFirstResponder];
    return YES;
}

- (void) submitClicked
{
  
    BOOL isEmpty = NO;
    NSString *message;
    
    //Checking if login fields are not empty
    if(username.text.length <= 0)
    {
        isEmpty = YES;
        message = @"Username cannot be empty. Let's try again.";
    }
    else if ( password.text.length <= 0 )
    {
        isEmpty = YES;
        message = @"Password cannot be empty. Let's try again.";
    }
    
    if (!isEmpty)
    {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Database" ofType:@"plist"];
        dict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
        
        NSArray *usernameCheck = [dict objectForKey:username.text];
        if (usernameCheck != nil) {
            if ([password.text isEqualToString:[usernameCheck objectAtIndex:1]]) {
                [user setObject:username.text forKey:@"username"];
                [user setObject:password.text forKey:@"password"];
                [delegate userIsLoggedIn];
            }
            else {
                isEmpty = YES;
                message = @"I don't think you entered the correct password. Let's try again.";
            }
        }
        else {
            isEmpty = YES;
            message = @"Woah! That is not a recognized username. Let's try again.";
        }
    }
    
    if(isEmpty)
    {
        UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertBox show];
    }
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            username.text = @"";
            password.text = @"";
            break;
         
        default:
            break;
    }
}

@end
