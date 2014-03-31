//
//  ContactsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

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
        parser = [[XMLParser alloc] init];
        parser.delegate = self;
        dataArray = nil;
    }
    return self;
}

- (void) loadTable
{
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 460.0) style:UITableViewStylePlain];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    [self.view addSubview:dataTable];
}

#pragma mark PROTOCOL
- (void) doneParsingWithData:(NSArray *)arr Status:(ParseStatus)status
{
    UIAlertView *alert;
    switch (status) {
        case PARSE_ERROR:
            //NSLog(@"PARSE_ERROR");
            alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error decoding message from the server" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            break;
            
        case NETWORK_ISSUE:
            //NSLog(@"NETWORK_ISSUE");
            alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error connecting to the server" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            break;
            
        case SUCCESFUL:
            //NSLog(@"NETWORK_ISSUE");
            dataArray = [[NSMutableArray alloc] initWithArray:arr];
            [self loadTable];
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"XML"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XML"];
    }
    Contact *temp = (Contact *) [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = temp.name;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedContactsViewController *details = [[DetailedContactsViewController alloc] initWithContact: (Contact *)[dataArray objectAtIndex: indexPath.row]];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

@end