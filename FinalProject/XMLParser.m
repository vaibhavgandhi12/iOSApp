//
//  XMLParser.m
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize delegate;

- (instancetype) init
{
    if ([super init]) {
        parsedOutData = [[NSMutableArray alloc] init];
        capturedData = [[NSMutableString alloc] init];
        shouldCaptureInformation = FALSE;
        parser = nil;
        [NSThread detachNewThreadSelector:@selector(startParsing) toTarget:self withObject:nil];
    }
    return self;
}

- (void) startParsing
{
    //    NSLog(@"StartParsing");
    NSString *strURL = [[NSString alloc] initWithString:@"http://10.0.0.229:8000/Public/ContactList.xml"];
    NSURL *url = [[NSURL alloc] initWithString:strURL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    bool parseResult = [parser parse];
    if (!parseResult) {
        if (delegate != nil) {
            [delegate doneParsingWithData:parsedOutData Status:PARSE_ERROR];
        }
    }
}

#pragma mark -
#pragma mark PROTOCOLS
- (void) parserDidStartDocument:(NSXMLParser *)parser
{
    //    NSLog(@"parserDidStartDocument");
}

- (void) parserDidEndDocument:(NSXMLParser *)parser
{
    //    NSLog(@"parserDidEndDocument");
    if (delegate != nil) {
        [delegate doneParsingWithData:parsedOutData Status:SUCCESFUL];
    }
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //    NSLog(@"didStartElement");
    if ([elementName isEqualToString:@"Contact"]) {
        tempObject = [[Contact alloc] init];
        //tempObject.description = [[ProjectDescription alloca] init];
        //shouldCaptureInformation = TRUE;
    }
    shouldCaptureInformation = TRUE;
    capturedData = [[NSMutableString alloc] init];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //    NSLog(@"didEndElement");
    if ([elementName isEqualToString:@"Contact"]) {
        [parsedOutData addObject:tempObject];
        [tempObject release];
        tempObject = nil;
    }
    else if ([elementName isEqualToString:@"JobTitle"]) {
        tempObject.job_title = capturedData;
    }
    else if ([elementName isEqualToString:@"Name"]) {
        tempObject.name = capturedData;
    }
    else if ([elementName isEqualToString:@"Email"]) {
        tempObject.email = capturedData;
    }
    else if ([elementName isEqualToString:@"Mobile"]) {
        tempObject.mobile = capturedData;
    }
    else if ([elementName isEqualToString:@"Phone"]) {
        tempObject.phone = capturedData;
    }
    else if ([elementName isEqualToString:@"DOB"]) {
        tempObject.dob = capturedData;
    }
    else if ([elementName isEqualToString:@"Street"]) {
            tempObject.street = capturedData;
    }
    else if ([elementName isEqualToString:@"City"]) {
        tempObject.city = capturedData;
    }
    else if ([elementName isEqualToString:@"Country"]) {
        tempObject.country = capturedData;
    }
    
    [capturedData release];
    capturedData = nil;
    shouldCaptureInformation = FALSE;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //    NSLog(@"foundCharacters");
    if (shouldCaptureInformation) {
        [capturedData appendString:string];
    }
}

- (void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    //    NSLog(@"parseErrorOccurred: %@", [parseError description]);
    if (delegate != nil) {
        [delegate doneParsingWithData:parsedOutData Status:PARSE_ERROR];
    }
}

@end