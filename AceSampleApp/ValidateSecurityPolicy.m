//
//  ValidateSecurityPolicy.m
//  AceSampleApp
//
//  Created by Shardul Navare on 5/28/15.
//  Copyright (c) 2015 AirWatch Demo. All rights reserved.
//

#import "ValidateSecurityPolicy.h"

@interface ValidateSecurityPolicy ()

@end

@implementation ValidateSecurityPolicy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com/#q=airwatch"]];
    // webViewAppTunnel.scalesPageToFit = YES;
    // webViewAppTunnel.autoresizesSubviews = YES;
    // webViewAppTunnel.frame = self.view.bounds;
    [webViewSecurityPolicy loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // Disable user selection
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    // Disable callout
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@synthesize webViewSecurityPolicy;
@end
