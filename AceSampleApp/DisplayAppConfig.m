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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
