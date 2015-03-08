//
//  ViewController.m
//  hackcdmx
//
//  Created by Alexis on 3/6/15.
//  Copyright (c) 2015 Alfredo Alexis Gonzalez Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser] && // Check if user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) { // Check if user is linked to Facebook
        // Present the next view controller without animation
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mapmain"];
        [self presentViewController:vc animated:NO completion:nil];
       // [self performSegueWithIdentifier:@"mapa" sender:self];
    }
    
}

@end

