//
//  DisplayAppConfig.m
//  AceSampleApp
//
//  Created by Shardul Navare on 5/26/15.
//  Copyright (c) 2015 AirWatch Demo. All rights reserved.
//

#import "DisplayAppConfig.h"

@interface DisplayAppConfig ()

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *udidLabel;
@property (weak, nonatomic) IBOutlet UITextField *usernameValueText;
@property (weak, nonatomic) IBOutlet UITextField *emailValueText;
@property (weak, nonatomic) IBOutlet UITextField *udidValueText;

@end

@implementation DisplayAppConfig

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add notification Center observer to be alerted of any changes to NSUserDefaults
    // Managed app configuration changes pushed down from an MDM server appear in NSUserDefaults
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NSUserDefaultsDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self readDefaultsValues];
                                                  }];

    // Call readDefaultValues to make sure default values are read at least once
    [self readDefaultsValues];
}

// The Managed App Configuration dictionary pushed down from an MDM server are stored in this key
static NSString * const kConfigurationKey = @"com.apple.configuration.managed";

// This Sample App allows for a username, email address and device udid
static NSString * const kConfigurationUsernameKey = @"Enrollment User";
static NSString * const kConfigurationEmailKey = @"User Email Address";
static NSString * const kConfigurationUdidKey = @"Device UDID";
static NSString * const kConfigurationSecurityPolicy = @"Security Policy";

- (void) readDefaultsValues {
    NSDictionary *serverConfig = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kConfigurationKey];
    
    // Validate the data coming from MDM server and if validation fails set it to some default value
    self.usernameLabel.text = @"UserName";
    NSString *username = serverConfig[kConfigurationUsernameKey];
    if (username && [username isKindOfClass: [NSString class]]) {
        self.usernameValueText.text = username;
    } else {
        self.usernameValueText.text = @"{username}";
    }
   
    self.emailLabel.text = @"Email";
    NSString *email = serverConfig[kConfigurationEmailKey];
    if (email && [email isKindOfClass:[NSString class]]) {
        self.emailValueText.text = email;
    } else {
        self.emailValueText.text = @"{email}";
    }
    
    self.udidLabel.text = @"UDID";
    NSString *udid = serverConfig[kConfigurationUdidKey];
    if (udid && [udid isKindOfClass:[NSString class]]) {
        self.udidValueText.text = udid;
    } else {
        self.udidValueText.text = @"{udid}";
    }
//    isSecurityPolicyEnabled = [NSNumber numberWithBool:TRUE];
   // isSecurityPolicyEnabled = serverConfig[kConfigurationSecurityPolicy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


@end
