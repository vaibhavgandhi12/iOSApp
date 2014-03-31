//
//  ConsumerSurveyViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "ConsumerSurveyViewController.h"

@interface ConsumerSurveyViewController ()

@end

@implementation ConsumerSurveyViewController

@synthesize delegate;

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

- (instancetype) initWithCoreData:(CoreData *)core
{
    if ([super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        coreData = core;
        [self createView];
    }
    return self;
}

- (void) createView
{
    scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0.0, 20.0, self.view.frame.size.width, self.view.frame.size.height - 20.0)];
    
    //scrollView.customizedDelegate = self;
    
    //1. Make co-ordinate variables
    float contentHeight = 20.0;
    float x = 50.0;
    float y = 20.0;
    float width = 220.0;
    float height = 50.0;
    
    //2. Create temp view components
    UILabel *tempLabel = nil;
    UITextField *tempTextField = nil;
    UISlider *tempSlider = nil;
    UIDatePicker *datePicker = nil;
    UIButton *tempButton = nil;
    UIImageView *tempImage = nil;
    
    NSArray *itemArray = nil;
    UISegmentedControl *tempSegmentedControl = nil;
    
    for(int i = 0; i < 19; i++)
    {
        switch (i) {
            case 0: //Title
                tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempLabel.text = @"Consumer Survey";
                tempLabel.font = [UIFont fontWithName:@"Zapfino" size:20.0];
                tempLabel.textAlignment = NSTextAlignmentCenter;
                tempLabel.tag = i;
                
                x -= 20.0;
                y += 80.0;
                width += 40.0;
                height -= 20.0;
                contentHeight += 80.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempLabel];
                
                break;
                
            case 1: //Name
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 2: //Age
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Age" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeNumberPad;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 3: //Gender
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Gender" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 4: //Email ID
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email ID" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeEmailAddress;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 5: //Street
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Street" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 6: //City
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"City" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 7: //State
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"State" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 8: //Country
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.borderStyle = UITextBorderStyleRoundedRect;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Country" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                width -= 210.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 9: //Type of os
                tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempLabel.text = @"OS";
                tempLabel.textAlignment = NSTextAlignmentLeft;
                tempLabel.tag = i;
                
                x += 60.0;
                width += 150.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempLabel];
                
                break;
                
            case 10: //ios / android win 8
                itemArray = [NSArray arrayWithObjects: @"iOS", @"Android", @"Windows", nil];
                tempSegmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
                tempSegmentedControl.frame = CGRectMake(x, y, width, height);
                tempSegmentedControl.selectedSegmentIndex = 0;
                tempSegmentedControl.tag = i;
                
                x -= 60.0;
                y += 50.0;
                width += 60.0;
                contentHeight += 50.0;
                
                [scrollView addSubview:tempSegmentedControl];
                
                break;
                
            case 11: //Survey Date
                tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempLabel.text = @"Date";
                tempLabel.textAlignment = NSTextAlignmentLeft;
                tempLabel.tag = i;
                
                y += 20.0;
                height += 100.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempLabel];
                
                break;
                
            case 12: //Date
                datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(x, y, width, height)];
                datePicker.datePickerMode = UIDatePickerModeDate;
                datePicker.date = [NSDate date];
                datePicker.tag = i;
                
                y += 220.0;
                width -= 190.0;
                height -= 100.0;
                contentHeight += 170.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:datePicker];
                
                break;
                
            case 13: //Type of gadget
                tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempLabel.text = @"Gadget";
                tempLabel.textAlignment = NSTextAlignmentLeft;
                tempLabel.tag = i;
                
                x += 60.0;
                width += 130.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempLabel];
                
                break;
                
            case 14: //phone tab laptop
                itemArray = [NSArray arrayWithObjects: @"Phone", @"Tablet", @"Laptop", nil];
                tempSegmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
                tempSegmentedControl.frame = CGRectMake(x, y, width, height);
                tempSegmentedControl.selectedSegmentIndex = 0;
                tempSegmentedControl.tag = i;
                
                x -= 60.0;
                y += 50.0;
                width += 60.0;
                width -= 200.0;
                contentHeight += 50.0;
                
                [scrollView addSubview:tempSegmentedControl];
                
                break;
                
            case 15: //Cost
                tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempLabel.text = @"Cost";
                tempLabel.textAlignment = NSTextAlignmentLeft;
                tempLabel.tag = i;
                
                x += 70.0;
                y += 15.0;
                width += 130.0;
                height -= 15.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempLabel];
                
                break;
                
            case 16: //Cost Slider
                tempSlider = [[UISlider alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempSlider.tag = i;
                
                x -= 70.0;
                y += 55.0;
                width += 70.0;
                height += 10;
                contentHeight += 50;
                
                width -= 200.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempSlider];
                
                break;
                
            case 17: //View button
                tempButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                tempButton.tag = i;
                tempButton.frame = CGRectMake(x, y, width, height);
                [tempButton setTitle:@"View" forState:UIControlStateNormal];
                [tempButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [tempButton addTarget:self action:@selector(viewClicked) forControlEvents:UIControlEventTouchDown];
                
                x += 220.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempButton];
                
                break;
                
            case 18: //Submit
                tempButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                tempButton.tag = i;
                tempButton.frame = CGRectMake(x, y, width, height);
                [tempButton setTitle:@"Submit" forState:UIControlStateNormal];
                [tempButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [tempButton addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventTouchDown];
                
                [scrollView addSubview:tempButton];
                
                break;
                
            default:
                break;
        }
        
        if(tempLabel != nil)
        {
            [tempLabel release];
            tempLabel = nil;
        }
        
        if(tempImage != nil)
        {
            [tempImage release];
            tempImage = nil;
        }
        
        if(tempTextField != nil)
        {
            [tempTextField release];
            tempTextField = nil;
        }
        if (tempSegmentedControl != nil) {
            [tempSegmentedControl release];
            tempSegmentedControl = nil;
        }
        if (tempSlider != nil) {
            [tempSlider release];
            tempSlider = nil;
        }
    }
    
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.view addSubview:scrollView];
    
}

- (void) submitClicked
{
    BOOL isEmpty = NO;
    NSString *message;
    
    arrayOfScrolls = [scrollView subviews];
    
    NSString *content = ((UITextField *) [arrayOfScrolls objectAtIndex:4]).text;
    
    if(((UITextField *)[arrayOfScrolls objectAtIndex:1]).text.length <= 0)
    {
        isEmpty = YES;
        message = @"Name cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:2]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"Age cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:3]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"Gender cannot be empty";
    }
    else if (content == nil || content.length == 0 || [content rangeOfString:@"@"].location == NSNotFound || [content rangeOfString:@"@"].location > [content rangeOfString:@".com"].location || content.length < 6)
    {
        isEmpty = YES;
        message = @"Invalid email";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:5]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"Street cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:6]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"City cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:7]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"State cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:8]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"Country cannot be empty";
    }
    
    if(isEmpty)
    {
        UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alertBox show];
    }
    else {
        [self survey];
    }
}

- (void) viewClicked
{
    [delegate changeToListPDFs];
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        default:
            break;
    }
}

- (void) survey
{
    NSString *name = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:1]).text];
    NSString *age = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:2]).text];
    NSString *gender = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:3]).text];
    NSString *email = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:4]).text];
    NSString *street = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:5]).text];
    NSString *city = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:6]).text];
    NSString *state = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:7]).text];
    NSString *country = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:8]).text];
    int osNO = ((UISegmentedControl *) [arrayOfScrolls objectAtIndex:10]).selectedSegmentIndex;
    NSString *os = [[NSString alloc] init];
    
    switch (osNO) {
        case 0:
            os = @"iOS";
            break;
            
        case 1:
            os = @"Android";
            break;
            
        case 2:
            os = @"Windows";
            break;
            
        default:
            break;
    }
    NSDate *date = ((UIDatePicker *) [arrayOfScrolls objectAtIndex:12]).date;
    int gadgetID = ((UISegmentedControl *) [arrayOfScrolls objectAtIndex:14]).selectedSegmentIndex;
    NSString *gadget = [[NSString alloc] init];
    
    switch (gadgetID) {
        case 0:
            gadget = @"Phone";
            break;
            
        case 1:
            gadget = @"Tablet";
            break;
            
        case 2:
            gadget = @"Laptop";
            break;
            
        default:
            break;
    }
    float costID = ((UISlider *) [arrayOfScrolls objectAtIndex:16]).value;
    NSString *cost = [NSString stringWithFormat:@"%f", costID];
    info = [NSArray arrayWithObjects:name, age, gender, email, street, city, state, country, os, [date description], gadget, cost, nil];
    
    NSLog(@"No of items: %lu", (unsigned long)[info count]);
    
    [self addSurvey];
}

- (void) addSurvey
{
    [coreData addSurvey:info];
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end