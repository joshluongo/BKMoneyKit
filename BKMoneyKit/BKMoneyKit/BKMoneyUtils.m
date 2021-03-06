//
//  BKMoneyUtils.m
//  BKMoneyKit
//
//  Created by Byungkook Jang on 2014. 8. 24..
//  Copyright (c) 2014년 Byungkook Jang. All rights reserved.
//

#import "BKMoneyUtils.h"

@implementation BKMoneyUtils

+ (NSRegularExpression *)nonNumericRegularExpression
{
    return [NSRegularExpression regularExpressionWithPattern:@"[^0-9]+" options:0 error:nil];
}

+ (NSCharacterSet *)numberCharacterSet
{
    return [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
}

+ (UIImage *)cardLogoImageWithShortName:(NSString *)shortName
{
    UIImage *cardLogoImage = nil;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    if (shortName) {
        //Check if local image exist
        UIImage *localCardLogoImage = [UIImage imageNamed:shortName];
        
        if (localCardLogoImage == nil) {
            cardLogoImage = [UIImage imageNamed:[NSString stringWithFormat:@"BKMoneyKit.bundle/CardLogo/%@@2x", shortName] inBundle:bundle compatibleWithTraitCollection:nil];
        } else {
            cardLogoImage = localCardLogoImage;
        }
    }
    
    if (nil == cardLogoImage) {
        cardLogoImage = [UIImage imageNamed:@"BKMoneyKit.bundle/CardLogo/default" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    
    return cardLogoImage;
}

@end
