//
//  DetailedContactsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "DetailedContactsViewController.h"

@interface DetailedContactsViewController ()

@end

@implementation DetailedContactsViewController

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

- (instancetype) initWithContact:(Contact *)temp
{
    if ([super init])
    {
        int y = 75;
        
        UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithTitle:@"Add Contact" style:UIBarButtonItemStylePlain target:self action:@selector(addContact)];
        self.navigationItem.rightBarButtonItem = add;
        [add release];
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        UILabel *jobTitle = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        jobTitle.text = [NSString stringWithFormat:@"JobTitle: %@", temp.job_title];
        [self.view addSubview:jobTitle];
        
        y += 30.0;
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        name.text = [NSString stringWithFormat:@"Name: %@", temp.name];
        [self.view addSubview:name];
        
        y += 30.0;
        
        UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        email.text = [NSString stringWithFormat:@"Email: %@", temp.email];
        [self.view addSubview:email];
        
        y += 30.0;
        
        UILabel *mobile = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        mobile.text = [NSString stringWithFormat:@"Mobile: %@", temp.mobile];
        [self.view addSubview:mobile];
        
        y += 30.0;
        
        UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        phone.text = [NSString stringWithFormat:@"Phone: %@", temp.phone];
        [self.view addSubview:phone];
        
        y += 30.0;
        
        UILabel *dob = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        dob.text = [NSString stringWithFormat:@"DOB: %@", temp.dob];
        [self.view addSubview:dob];
        
        y += 30.0;
        
        UILabel *street = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        street.text = [NSString stringWithFormat:@"Street: %@", temp.street];
        [self.view addSubview:street];
        
        y += 30.0;
        
        UILabel *city = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        city.text = [NSString stringWithFormat:@"City: %@", temp.city];
        [self.view addSubview:city];
        
        y += 30.0;
        
        UILabel *country = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        country.text = [NSString stringWithFormat:@"Country: %@", temp.country];
        [self.view addSubview:country];
        
        tempC = temp;
    }
    return self;
}

- (void) addContact
{
    ABUnknownPersonViewController *newPicker = [[ABUnknownPersonViewController alloc] init];
    newPicker.unknownPersonViewDelegate = self;
    
    ABRecordRef new_person;
    new_person = ABPersonCreate();
    
    CFErrorRef err = NULL;
    
    NSString *jobTitle = tempC.job_title;
    bool res = ABRecordSetValue(new_person, kABPersonJobTitleProperty, (CFStringRef)jobTitle, &err);
    if(err)
    {
        NSLog(@"kABPersonJobTitleProperty");
    }
    
    NSString *name = tempC.name;
    res = ABRecordSetValue(new_person, kABPersonFirstNameProperty, (CFStringRef)name, &err);
    if(err)
    {
        NSLog(@"kABPersonFirstNameProperty");
    }
    
    NSString *phoneNO = tempC.phone;
    NSString *mobile = tempC.mobile;
    ABMultiValueRef phone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    res = ABMultiValueAddValueAndLabel(phone, phoneNO, kABPersonPhoneIPhoneLabel, NULL);
    res = ABMultiValueAddValueAndLabel(phone, mobile, kABPersonPhoneMobileLabel, NULL);
    res = ABRecordSetValue(new_person, kABPersonPhoneProperty, phone, &err);
    if(err != nil)
    {
        NSLog(@"kABPersonPhoneProperty");
    }
    
    NSString *email = tempC.email;
    ABMultiValueRef temp = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    res = ABMultiValueAddValueAndLabel(temp, email, kABWorkLabel, NULL);
    res = ABRecordSetValue(new_person, kABPersonEmailProperty, temp, &err);
    if(err != nil)
    {
        NSLog(@"kABPersonEmailProperty");
    }
    
    //Add address!!!!!
    
    newPicker.displayedPerson = new_person;
    newPicker.allowsAddingToAddressBook = YES;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newPicker];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) displayPerson : (ABRecordRef) person
{
    NSString *jobTitle = (NSString *) ABRecordCopyValue(person, kABPersonJobTitleProperty);
    NSString *name = (NSString *) ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *email = (NSString *) ABRecordCopyValue(person, kABPersonEmailProperty);
    NSString *phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    if(ABMultiValueGetCount(phoneNumbers) > 0)
    {
        phone = (NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    }
    
    NSLog(@"%@ %@ %@ %@", jobTitle, name, phone, email);
}

- (void) unknownPersonViewController:(ABUnknownPersonViewController *)unknownCardViewController didResolveToPerson:(ABRecordRef)person
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
