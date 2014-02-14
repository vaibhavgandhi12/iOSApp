//
//  SurveyReportsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/16/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "SurveyReportsViewController.h"
#import "Entity1.h"
#import "DetailedSurveyViewController.h"

@interface SurveyReportsViewController ()

@end

@implementation SurveyReportsViewController

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

- (void) viewWillAppear:(BOOL)animated
{
    if (auto_refresh) {
        [self startData];
    }
}

- (void) viewDidDisappear:(BOOL)animated
{
    if (auto_refresh) {
        if (surveys != nil) {
            [surveys release];
            surveys = nil;
        }
    }
}

- (instancetype) initWithCoreData:(CoreData *)core
{
    if ([super init]) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        auto_refresh = [user boolForKey:@"auto_refresh"];
        
        if (!auto_refresh) {
            UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refreshPage)];
            self.navigationItem.rightBarButtonItem = refresh;
            [refresh release];
            [self startData];
        }
        
        self.navigationItem.title = @"Consumer Survey";
        self.view.backgroundColor = [UIColor whiteColor];
        coreData = core;
        [self createView];
    }
    return self;
}

- (void) startData
{
    surveys = [[NSMutableArray alloc] init];
    surveys = [coreData fetchSurveys];
    //NSLog(@"Count %d",[surveys count]);
    if (table != nil) {
        [table reloadData];
    }
}

- (void) refreshPage
{
    if (surveys != nil) {
        [surveys release];
        surveys = nil;
    }
    [self startData];
}

- (void) createView
{
    flag = 0;
    //NSLog(@"%d",[surveys count]);
    table = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 480.0) style:UITableViewStylePlain];
    
    table.dataSource = self;
    table.delegate = self;
    
    [self.view addSubview:table];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",[surveys count]);
    if ([surveys count] == 0) {
        return 1;
    }
    else
        return [surveys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    if ([surveys count] == 0 && indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"No surveys yet!"];
    }
    else {
        Entity1 *temp = (Entity1 *)[surveys objectAtIndex:indexPath.row];
        //NSLog(@"%@",temp.name);
        cell.textLabel.text = (NSString *)temp.date;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedSurveyViewController *details = [[DetailedSurveyViewController alloc] initWithEntity:(Entity1 *)[surveys objectAtIndex:indexPath.row] initWithCoreData:coreData];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

@end
