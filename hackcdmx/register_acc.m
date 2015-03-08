//
//  register_acc.m
//  hackcdmx
//
//  Created by Alexis on 3/7/15.
//  Copyright (c) 2015 Alfredo Alexis Gonzalez Rodriguez. All rights reserved.
//

#import "register_acc.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>

@interface register_acc ()

@end

@implementation register_acc
@synthesize namefield,mailfield,passwordfield;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)register_fb:(id)sender {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
        } else {
            NSLog(@"User with facebook logged in!");
        }
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mapmain"];
        [self presentViewController:vc animated:NO completion:nil];
    }];
}
- (IBAction)register_tw:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
        } else {
            NSLog(@"User logged in with Twitter!");
        }
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mapmain"];
        [self presentViewController:vc animated:NO completion:nil];
        
    }];
}
- (IBAction)register_mail:(id)sender {
    PFUser *user = [PFUser user];
    user.username = namefield.text;
    user.password = passwordfield.text;
    user.email = mailfield.text;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
