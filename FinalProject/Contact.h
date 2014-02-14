//
//  Contact.h
//  FinalProject
//
//  Created by Vaibhav Gandhi on 1/17/14.
//  Copyright (c) 2014 Vaibhav Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (copy, nonatomic) NSString *job_title;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *mobile;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *dob;
@property (copy, nonatomic) NSString *street;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *country;

@end

/*
<Contact>
    <JobTitle>Web Developer</JobTitle>
    <Name>John Doe</Name>
    <Email>john.doe@gmail.com</Email>
    <Mobile>5293458989</Mobile>
    <Phone>7203160954</Phone>
    <DOB>04271983</DOB>
    <Address>
        <Street>949 West Adams Blvd, Apt. 21</Street>
        <City>Los Angeles</City>
        <Country>USA</Country>
    </Address>
</Contact>
*/