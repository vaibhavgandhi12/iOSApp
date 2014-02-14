//
//  ListPDFsViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "ListPDFsViewController.h"

@interface ListPDFsViewController ()

@end

@implementation ListPDFsViewController

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
    listPDFs = [[NSMutableArray alloc] init];
    listPDFs = [coreData fetchPDFs];
    //NSLog(@"Count %d",[listPDFs count]);
    if (table != nil) {
        [table reloadData];
    }
}

- (void) viewDidDisappear:(BOOL)animated
{
    if (listPDFs != nil) {
        [listPDFs release];
        listPDFs = nil;
    }
}

- (instancetype) initWithCoreData:(CoreData *)core
{
    if ([super init]) {
        //self.navigationItem.title = @"List of PDFs";
        self.view.backgroundColor = [UIColor whiteColor];
        coreData = core;
        [self createView];
    }
    return self;
}

- (void) createView
{
    flag = 0;
    //NSLog(@"%d",[listPDFs count]);
    table = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 20.0, 300.0, 460.0) style:UITableViewStylePlain];
    
    table.dataSource = self;
    table.delegate = self;
    
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",[listPDFs count]);
    if ([listPDFs count] == 0) {
        return 1;
    }
    else
        return [listPDFs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    if ([listPDFs count] == 0 && indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"No PDFs yet!"];
    }
    else {
        NSString *temp = (NSString *)[listPDFs objectAtIndex:indexPath.row];
        //NSLog(@"%@",temp.name);
        cell.textLabel.text = (NSString *)temp;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    DetailedSurveyViewController *details = [[DetailedSurveyViewController alloc] initWithEntity:(Entity1 *)[listPDFs objectAtIndex:indexPath.row] initWithCoreData:coreData];
//    [self.navigationController pushViewController:details animated:YES];
//    [details release];
    [self showInManager:[listPDFs objectAtIndex:indexPath.row]];
}

- (void) showInManager:(NSString *)pdfFile
{
    NSURL *fileURL = [NSURL fileURLWithPath:pdfFile];
    [self setupDocumentControllerWithURL: fileURL];
    [doInteractionController presentPreviewAnimated:YES];
}

- (void) setupDocumentControllerWithURL:(NSURL *)url
{
    if (doInteractionController == nil) {
        doInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        doInteractionController.delegate = self;
    }
    else {
        doInteractionController.URL = url;
    }
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
{
    return self;
}



@end
