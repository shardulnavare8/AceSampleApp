//
//  ViewController.m
//  AceSampleApp
//
//  Created by Shardul Navare on 5/26/15.
//  Copyright (c) 2015 AirWatch Demo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
- (IBAction)launchInternalUrl:(id)sender {
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.cnn.com"]];
}
 */

- (IBAction)performSingleSignOn:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    
    if (![[UIApplication sharedApplication] openURL:url]) {
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}


-(IBAction)doneToViewController:(UIStoryboardSegue *)segue {
}

-(IBAction)doneToViewControllerFromAppTunnel:(UIStoryboardSegue *)segue {
}

-(IBAction)doneToViewControllerFromSecurityPolicy:(UIStoryboardSegue *)segue {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
