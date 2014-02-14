//
//  XMLParser.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

enum ParseStatus {
    PARSE_ERROR = 0,
    NETWORK_ISSUE,
    SUCCESFUL
};
typedef enum ParseStatus ParseStatus;

@protocol XMLParserDelegate <NSObject>

- (void) doneParsingWithData: (NSArray *)arr Status: (ParseStatus)status;

@end

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *parser;
    bool shouldCaptureInformation;
    NSMutableString *capturedData;
    NSMutableArray *parsedOutData;
    Contact *tempObject;
}

@property (assign, nonatomic) id<XMLParserDelegate> delegate;

@end
