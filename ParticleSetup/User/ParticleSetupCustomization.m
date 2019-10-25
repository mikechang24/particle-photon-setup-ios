//
//  ParticleSetupCustomization.m
//  mobile-sdk-ios
//
//  Created by Ido Kleinman on 12/12/14.
//  Copyright (c) 2014-2015 Particle. All rights reserved.
//

#import "ParticleSetupCustomization.h"
#import "ParticleSetupMainController.h"


@interface UIColor (withDecimalRGB) // TODO: move to category in helpers
+ (UIColor *)colorWithRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
@end

@implementation UIColor (withDecimalRGB) // TODO: move to category in helpers
+ (UIColor *)colorWithRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b {
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end

@implementation ParticleSetupCustomization


+ (instancetype)sharedInstance {
    static ParticleSetupCustomization *sharedInstance = nil;
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;

}


- (instancetype)init {
    if (self = [super init]) {
        // Defaults
        self.deviceName = @"Particle device";
        self.brandName = @"Particle";
        self.brandImage = [ParticleSetupMainController loadImageFromResourceBundle:@"spark-logo-head"];
        self.brandImageBackgroundColor = [UIColor colorWithRed:229 green:229 blue:237];
        self.brandImageBackgroundImage = nil;

        self.modeButtonName = @"Setup button";
        self.networkNamePrefix = @"Photon";
        self.listenModeLEDColorName = @"blue";
        self.fontSizeOffset = 0;

        self.privacyPolicyLinkURL = [NSURL URLWithString:@"https://www.particle.io/legal/privacy"];
        self.termsOfServiceLinkURL = [NSURL URLWithString:@"https://www.particle.io/legal/terms-of-service"];
        self.forgotPasswordLinkURL = [NSURL URLWithString:@"https://login.particle.io/forgot"];
        self.troubleshootingLinkURL = [NSURL URLWithString:@"https://community.spark.io/t/spark-core-troubleshooting-guide-spark-team/696"];
        // TODO: add default HTMLs

        self.normalTextColor = [UIColor colorWithRed:28 green:26 blue:25];
        self.pageBackgroundColor = [UIColor colorWithWhite:0.94 alpha:1.0f];
        self.linkTextColor = [UIColor blueColor];
        self.elementBackgroundColor = [UIColor colorWithRed:0 green:165 blue:231];
        self.elementTextColor = [UIColor whiteColor];

        self.normalTextFontName = @"HelveticaNeue";
        self.boldTextFontName = @"HelveticaNeue-Bold";
        self.headerTextFontName = @"HelveticaNeue-Light";

        self.tintSetupImages = NO;
        self.lightStatusAndNavBar = YES;

        self.productId = 0;
        self.productMode = NO;
        self.productName = @"Photon";
        self.allowPasswordManager = YES;

        self.allowSkipAuthentication = NO;
        self.skipAuthenticationMessage = @"Skipping authentication will allow you to configure Wi-Fi credentials to your device but it will not be claimed to your account. Are you sure you want to skip authentication?";
        self.disableLogOutOption = NO;
        return self;
    }

    return nil;
}

@end
