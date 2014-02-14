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
    if ([super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}

- (void) createView
{
    scrollView = [[CustomScrollView alloc] initWithFrame: CGRectMake(0.0, 20.0, self.view.frame.size.width, self.view.frame.size.height - 20.0)];
    
    //scrollView.customizedDelegate = self;
    
    //1. Make co-ordinate variables
    float contentHeight = 20.0;
    float x = 30.0;
    float y = 20.0;
    float width = 60.0;
    float height = 80.0;
    
    //2. Create temp view components
    UILabel *tempLabel = nil;
    UITextField *tempTextField = nil;
    UISlider *tempSlider = nil;
    UIDatePicker *datePicker = nil;
    UIButton *tempButton = nil;
    UIImageView *tempImage = nil;
    
    NSArray *itemArray = nil;
    UISegmentedControl *tempSegmentedControl = nil;
    
    for(int i = 0; i <= 18; i++)
    {
        switch (i) {
            case 0: //Logo
                tempImage = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
                //[tempImage initWithImage:[UIImage imageNamed:@"a1.png"]];
                tempImage.tag = i;
                tempImage.image = [UIImage imageNamed:@"a1.png"];
                x += 70.0;
                width += 200.0;
                contentHeight += 80.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempImage];
                
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
                
            case 3: //Gender
                
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
                
            case 6: //Street
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
                
            case 7: //City
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
                
            case 8: //State
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
                
            case 9: //Country
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.borderStyle = UITextBorderStyleBezel;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Country" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                width -= 200.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 10: //Type of os
                
            case 11: //ios / android win 8
                itemArray = [NSArray arrayWithObjects: @"BE", @"MS", @"PhD", nil];
                tempSegmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
                tempSegmentedControl.frame = CGRectMake(x, y, width, height);
                tempSegmentedControl.selectedSegmentIndex = 0;
                tempSegmentedControl.tag = i;
                
                y += 50.0;
                contentHeight += 50.0;
                
                [scrollView addSubview:tempSegmentedControl];
                
                break;
                
            case 12: //Survey Date
                
            case 13: //Date
                datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(x, y, width, height)];
                datePicker.datePickerMode = UIDatePickerModeDate;
                datePicker.date = [NSDate date];
                datePicker.tag = i;
                
                y += 220.0;
                height -= 120.0;
                contentHeight += 170.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:datePicker];
                
                break;
                
            case 14: //Type of gadget
                
            case 15: //phone tab laptop
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"University" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 16: //cost
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Branch" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 17: //costSlider
                tempTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                tempTextField.tag = i;
                tempTextField.delegate = self;
                tempTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Branch" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
                tempTextField.keyboardType = UIKeyboardTypeDefault;
                
                y += 50.0;
                contentHeight += 50.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
                [scrollView addSubview:tempTextField];
                
                break;
                
            case 18: //Submit
                tempButton = [UIButton buttonWithType:UIButtonTypeSystem];
                tempButton.tag = i;
                tempButton.frame = CGRectMake(x, y, width, height);
                [tempButton setTitle:@"Create" forState:UIControlStateNormal];
                [tempButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [tempButton addTarget:self action:@selector(createClicked) forControlEvents:UIControlEventTouchDown];
                
                y += 50.0;
                contentHeight += 150.0;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, contentHeight);
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

- (void) createClicked
{
    BOOL isEmpty = NO;
    NSString *message;
    
    arrayOfScrolls = [scrollView subviews];
    
    NSString *content = ((UITextField *) [arrayOfScrolls objectAtIndex:4]).text;
    
    if(((UITextField *)[arrayOfScrolls objectAtIndex:3]).text.length <= 0)
    {
        isEmpty = YES;
        message = @"Name cannot be empty";
    }
    else if ( [((UITextField *)[arrayOfScrolls objectAtIndex:5]).text isEqualToString:@""] )
    {
        isEmpty = YES;
        message = @"Phone cannot be empty";
    }
    else if (content == nil || content.length == 0 || [content rangeOfString:@"@"].location == NSNotFound || [content rangeOfString:@"@"].location > [content rangeOfString:@".com"].location || content.length < 6)
    {
        isEmpty = YES;
        message = @"Invalid email";
    }
    
    if(isEmpty)
    {
        UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alertBox show];
    }
    else {
        [self addPerson];
//        WeekendProjectContinuedViewController *w = [[WeekendProjectContinuedViewController alloc] init];
//        [self.navigationController pushViewController:w animated:YES];
//        [w release];
        
    }
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            break;
            
        default:
            break;
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) checkForFile
{
    //Get the path to the "documents" directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //get the path to our plist ("documents/foo.plist")
    plistPath = [documentsDirectory stringByAppendingPathComponent:@"contactInfo.plist"];
    
    //read or create plist file
    
    //Check if our plist file already exists in the documents directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if( [fileManager fileExistsAtPath:plistPath]) {
        return true;
    }
    else {
        return false;
    }
}

- (void) addPerson
{
    BOOL check = [self checkForFile];
    
    NSMutableDictionary *dict;
    NSLog(@"Path: %@", plistPath);
    if( check ) {
        dict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    }
    else {
        NSLog(@"Creating dictionary for writing");
        dict = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    
    NSString *job_title = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:2]).text];
    NSString *name = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:3]).text];
    NSString *email = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:4]).text];
    NSString *contact = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:5]).text];
    NSString *street = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:6]).text];
    NSString *city = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:7]).text];
    NSString *state = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:8]).text];
    NSString *country = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:9]).text];
    //    float travel = ((UISlider *) [arrayOfScrolls objectAtIndex:11]).value;
    //    int qualification = ((UISegmentedControl *) [arrayOfScrolls objectAtIndex:13]).selectedSegmentIndex;
    NSString *gpa = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:14]).text];
    NSDate *graduation_date = ((UIDatePicker *) [arrayOfScrolls objectAtIndex:15]).date;
    NSString *university = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:16]).text];
    NSString *branch = [[NSString alloc] initWithString:((UITextField *) [arrayOfScrolls objectAtIndex:17]).text];
    
    //    NSArray *info = [NSArray arrayWithObjects:job_title, name, email, contact, street, city, state, country, travel, qualification, gpa, graduation_date, university, branch, nil];
    
    NSArray *info = [NSArray arrayWithObjects:job_title, name, email, contact, street, city, state, country, gpa, graduation_date, university, branch, nil];
    
    NSLog(@"No of items: %lu", (unsigned long)[info count]);
    
    [dict setObject:info forKey:name];
    [dict writeToFile:plistPath atomically:YES];
    
    NSLog(@"Success writing");
}

@end