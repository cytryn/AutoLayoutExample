//
//  PlantZombieViewController.m
//  AutoLayoutExample
//
//  Created by Andre Cytryn on 11/5/14.
//
//

#import "PlantZombieViewController.h"

@interface PlantZombieViewController ()

@end

@implementation PlantZombieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)smashButtonTapped:(UIButton *)button {
    if (self.plantTopConstraint.constant == 0) {
        button.titleLabel.text = @"SMASH";
        [UIView animateWithDuration:1.0 animations:^{
            self.plantTopConstraint.constant = self.view.frame.size.height - self.plantImageView.frame.size.height;
            [self.view layoutIfNeeded];
        }];
    } else {
        button.titleLabel.text = @"RESET";
        self.plantTopConstraint.constant = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
