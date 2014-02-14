//
//  AboutUsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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
    logo = [[UIImageView alloc] initWithFrame:CGRectMake(20.0, 30.0, 60.0, 78.0)];
    logo.image = [UIImage imageNamed:@"logo.png"];
    [self.view addSubview:logo];
    
    description = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 30.0, 210.0, 90.0)];
    description.text = @"Apple Inc. is an American multinational corporation headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software and personal computers.";
    description.font = [UIFont fontWithName:@"Arial" size:12.0];
    description.numberOfLines = 0;
    [self.view addSubview:description];
    
    tempToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(30.0, 125.0, 260.0, 30.0)];
    [tempToolbar setBarStyle:UIBarStyleDefault];
    
    tempToolbar.barTintColor = [UIColor whiteColor];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"SMS" style:UIBarButtonItemStylePlain target:self action:@selector(sendSMS)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Email" style:UIBarButtonItemStylePlain target:self action:@selector(sendEmail)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"Facebook" style:UIBarButtonItemStylePlain target:self action:@selector(postOnFB)];
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithTitle:@"Twitter" style:UIBarButtonItemStylePlain target:self action:@selector(postOnTwitter)];
    
    NSArray *array = [NSArray arrayWithObjects:item1, item2, item3, item4, nil];
    
    [tempToolbar setItems:array];
    
    [self.view addSubview:tempToolbar];
}

- (void) sendSMS
{
    Class sms = NSClassFromString(@"MFMessageComposeViewController");
    if (sms != nil) {
        if ([MFMessageComposeViewController canSendText]) {
            MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
            picker.messageComposeDelegate = self;
            
            //Fill out the text body
            NSString *smsBody = @"Check out Apple Inc - http://apple.com";
            [picker setBody:smsBody];
            
            //Present the mail composition interface
            [self presentViewController:picker animated:YES completion:nil];
            [picker release];
        }
        else
        {
            NSLog(@"Failed sending the text!");
        }
    }
}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Email
- (void) sendEmail
{
    Class email = NSClassFromString(@"MFMailComposeViewController");
    if (email != nil) {
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            picker.mailComposeDelegate = self;
            [picker setSubject:@"Check This!"];
            
            //Set up recipients
            NSArray *toRecipients = [NSArray arrayWithObjects:@"vaibhavgandhi12@gmail.com", nil];
            NSArray *cc = [NSArray arrayWithObjects:@"vaibhavgandhi12@facebook.com", nil];
            NSArray *bcc = [NSArray arrayWithObjects:@"vaibhavgandhi89@yahoo.co.in", nil];
            [picker setToRecipients:toRecipients];
            [picker setCcRecipients:cc];
            [picker setBccRecipients:bcc];
            
            //Attach an image
            NSString *path = [[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"];
            NSData *imageData = [NSData dataWithContentsOfFile:path];
            [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"logo.png"];
            
            //Mail body
            NSString *emailBody = @"Check out Apple Inc - http://apple.com"; //Can be HTML Code.
            [picker setMessageBody:emailBody isHTML:NO];
            
            //Present the email composition interface
            [self presentViewController:picker animated:YES completion:nil];
            [picker release];
        }
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) postOnFB
{
    Class fb = NSClassFromString(@"SLComposeViewController");
    if (fb != nil) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            SLComposeViewController *picker = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [picker setInitialText:@"Check out Apple Inc"];
            [picker addImage:[UIImage imageNamed: @"logo.png"]];
            [picker addURL:[[NSURL alloc] initWithString:@"http://apple.com"]];
            [self presentViewController:picker animated:YES completion:nil];
        }
        else
        {
            NSLog(@"Failed posting on Facebook!");
        }
    }
}

- (void) postOnTwitter
{
    Class twitter = NSClassFromString(@"SLComposeViewController");
    if (twitter != nil)
    {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            SLComposeViewController *picker = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [picker setInitialText:@"Check out Apple Inc"];
            [picker addImage:[UIImage imageNamed: @"logo.png"]];
            [picker addURL:[[NSURL alloc] initWithString:@"http://apple.com"]];
            [self presentViewController:picker animated:YES completion:nil];
        }
        else
        {
            NSLog(@"Failed posting on Twitter!");
        }
    }
}


@end
