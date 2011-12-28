//
//  DetailViewController.h
//  Zombie Tester
//
//  Created by Daniel Demiss on 28.12.11.
//  Copyright (c) 2011 CELLULAR GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "intermittentVC.h"

@interface DetailViewController : intermittentVC

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
