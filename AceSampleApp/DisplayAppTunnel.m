//
//  DisplayAppTunnel.m
//  AceSampleApp
//
//  Created by Shardul Navare on 5/27/15.
//  Copyright (c) 2015 AirWatch Demo. All rights reserved.
//

#import "DisplayAppTunnel.h"

@interface DisplayAppTunnel ()

@end

@implementation DisplayAppTunnel

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://internal.airwlab.com"]];
   // webViewAppTunnel.scalesPageToFit = YES;
   // webViewAppTunnel.autoresizesSubviews = YES;
   // webViewAppTunnel.frame = self.view.bounds;
    [webViewAppTunnel loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@synthesize webViewAppTunnel;

@end
