//
//  DetailedSurveyViewController.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "DetailedSurveyViewController.h"

@interface DetailedSurveyViewController ()

@end

@implementation DetailedSurveyViewController

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

- (instancetype) initWithEntity:(Entity1 *)source initWithCoreData:(CoreData *)core
{
    if ([super init])
    {
        coreData = core;
        UIBarButtonItem *print = [[UIBarButtonItem alloc] initWithTitle:@"Print PDF" style:UIBarButtonItemStylePlain target:self action:@selector(printPDF)];
        self.navigationItem.rightBarButtonItem = print;
        [print release];
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        int y = 75;
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        name.text = [NSString stringWithFormat:@"Name: %@", source.name];
        [self.view addSubview:name];
        
        y += 30.0;
        
        UILabel *age = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        age.text = [NSString stringWithFormat:@"Age: %@", source.age];
        [self.view addSubview:age];
        
        y += 30.0;
        
        UILabel *gender = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        gender.text = [NSString stringWithFormat:@"Gender: %@", source.gender];
        [self.view addSubview:gender];
        
        y += 30.0;
        
        UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        email.text = [NSString stringWithFormat:@"Email: %@", source.email];
        [self.view addSubview:email];
        
        y += 30.0;
        
        UILabel *street = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        street.text = [NSString stringWithFormat:@"Street: %@", source.street];
        [self.view addSubview:street];
        
        y += 30.0;
        
        UILabel *city = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        city.text = [NSString stringWithFormat:@"City: %@", source.city];
        [self.view addSubview:city];
        
        y += 30.0;
        
        UILabel *state = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        state.text = [NSString stringWithFormat:@"State: %@", source.state];
        [self.view addSubview:state];
        
        y += 30.0;
        
        UILabel *country = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        country.text = [NSString stringWithFormat:@"Country: %@", source.country];
        [self.view addSubview:country];
        
        y += 30.0;
        
        UILabel *os = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        os.text = [NSString stringWithFormat:@"OS: %@", source.os];
        //country.layer.borderWidth = 1.0;
        [self.view addSubview:os];
        
        y += 30.0;
        
        dateID = source.date;
        
        UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        date.text = [NSString stringWithFormat:@"Date: %@", source.date];
        //date.layer.borderWidth = 1.0;
        [self.view addSubview:date];
        
        y += 30.0;
        
        UILabel *gadget = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        gadget.text = [NSString stringWithFormat:@"Gadget: %@", source.gadget];
        [self.view addSubview:gadget];
        
        y += 30.0;
        
        UILabel *cost = [[UILabel alloc] initWithFrame:CGRectMake(30.0, y, 270.0, 20.0)];
        cost.text = [NSString stringWithFormat:@"Cost: %@", source.cost];
        [self.view addSubview:cost];
        
        //data = [[NSString alloc] init];
        
        data = [NSString stringWithFormat:@"%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@ \n%@", name.text, age.text, gender.text, email.text, street.text, city.text, state.text, country.text, os.text, date.text, gadget.text, cost.text];
        
        //NSLog(@"%@", data);
        printableData = [data copy];
    }
    return self;
}

- (void) printPDF
{
    //Prepare the text using a Core text framework
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, (CFStringRef)data, NULL);
    if (currentText) {
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
        if (framesetter) {
            NSString *path  = [[NSBundle mainBundle] pathForResource:@"sampledata" ofType:@"plist"];
            
            //get a temporary filename for this pdf
            path = NSTemporaryDirectory();
            
            NSString *pdfFileName = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.pdf", dateID]];
            
            //Create the pdf context using the default page size of 612 x 792.
            UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
            
            CFRange currentRange = CFRangeMake(0, 0);
            NSInteger currentPage = 0;
            
            BOOL done = NO;
            
            do {
                //Mark the beginning of a new page.
                UIGraphicsBeginPDFPageWithInfo(CGRectMake(0.0, 0.0, 612.0, 792.0), nil);
                
                //Draw a page number at the bottom of each page.
                currentPage++;
                [self drawPageNumber:currentPage];
                
                //Render the current page and update the current range to
                //point to the beginning of the next page.
                currentRange = [self renderPage:currentPage withTextRange:currentRange andFramesetter:framesetter];
                
                //If we are at the end of the text, exit the loop
                if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText)) {
                    done = YES;
                }
            } while (!done);
            
            //Close the PDF context and write the contents out.
            UIGraphicsEndPDFContext();
            
            pdfFile = [[NSString alloc] initWithString:pdfFileName];
            
            //Release the framesetter/
            CFRelease(framesetter);
            [coreData addPDF:pdfFileName];
            [self showInManager];
        }
        else {
            NSLog(@"Could not create the framesetter needed to lay out the attributed string.");
        }
        //Release the attributed string
        CFRelease(currentText);
    }
    else {
        NSLog(@"Could not create the attributed string for the framesetter");
    }
}

//Use core text to draw the text in a frame on the page
- (CFRange) renderPage:(NSInteger)pageNum withTextRange:(CFRange)currentRange andFramesetter:(CTFramesetterRef)framesetter
{
    //Get the graphics context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //Put the text matric into a known state. This ensures
    //that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    //Create a path object to enclose the text. Use 72 point
    //margines all around the text.
    CGRect frameRect = CGRectMake(72.0, 72.0, 468.0, 648.0);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    //Get the frame that will do the rendering.
    //The currentRange variable specifies only the starting point. The framsetter
    //lays out as much text as will fit into the form.
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    //Core text draws from the bottom left corner up, so flip
    //the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792.0);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    //Draw the frame
    CTFrameDraw(frameRef, currentContext);
    
    //Update the current range based on what was drawn.
    currentRange = CTFrameGetVisibleStringRange(frameRef);
    currentRange.location += currentRange.length;
    currentRange.length = 0;
    CFRelease(frameRef);
    
    return currentRange;
}

- (void) drawPageNumber:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %ld", (long)pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612.0, 72.0);
    
    CGSize pageStringSize = [pageString sizeWithFont:theFont constrainedToSize:maxSize lineBreakMode:NSLineBreakByClipping];
    
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0), 720.0 + ((72.0 - pageStringSize.height) / 2.0), pageStringSize.width, pageStringSize.height);
    
    [pageString drawInRect:stringRect withFont:theFont];
}

- (void) showInManager
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
