//
//  ValidateSecurityPolicy.m
//  AceSampleApp
//
//  Created by Shardul Navare on 5/28/15.
//  Copyright (c) 2015 AirWatch Demo. All rights reserved.
//

#import "ValidateSecurityPolicy.h"
#import "DisplayAppConfig.h"

@interface ValidateSecurityPolicy ()

@end

@implementation ValidateSecurityPolicy

static NSString * const kConfigurationKey = @"com.apple.configuration.managed";
static NSString * const kConfigurationSecurityPolicy = @"Security Policy";


NSNumber *isSecurityPolicyEnabled;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com/#q=airwatch"]];
    [webViewSecurityPolicy loadRequest:request];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuShown) name:UIMenuControllerDidShowMenuNotification object:nil];
}

-(void) menuShown {
    NSDictionary *serverConfig = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kConfigurationKey];
    isSecurityPolicyEnabled = serverConfig[kConfigurationSecurityPolicy];
//    isSecurityPolicyEnabled = [NSNumber numberWithBool:TRUE];
    if ([isSecurityPolicyEnabled boolValue] == YES) {
        [webViewSecurityPolicy setUserInteractionEnabled:NO];
        [webViewSecurityPolicy setUserInteractionEnabled:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
}

@synthesize webViewSecurityPolicy;
@end
