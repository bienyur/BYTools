//
//  EAIntroPage.m
//  EAIntroView
//
//  Copyright (c) 2013 Evgeny Aleksandrov.
//

#import "EAIntroPage.h"

@implementation EAIntroPage

+ (EAIntroPage *)page {
    EAIntroPage *newPage = [[[EAIntroPage alloc] init] autorelease];
    newPage.imgPositionY    = 0.0f;
    newPage.titlePositionY  = 0.0f;
    newPage.descPositionY   = 140.0f;
    newPage.title = @"";
    newPage.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    newPage.titleColor = [UIColor whiteColor];
    newPage.desc = @"";
    newPage.descFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    newPage.descColor = [UIColor whiteColor];
    
    return newPage;
}

+ (EAIntroPage *)pageWithCustomView:(UIView *)customV {
    EAIntroPage *newPage = [[[EAIntroPage alloc] init] autorelease];
    newPage.customView = customV;
    
    return newPage;
}

@end
