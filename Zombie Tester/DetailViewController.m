//
//  DetailViewController.m
//  Zombie Tester
//
//  Created by Daniel Demiss on 28.12.11.
//  Copyright (c) 2011 CELLULAR GmbH. All rights reserved.
//

#import "DetailViewController.h"
#import "helper.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

	if (self.detailItem) {
	    self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	__unsafe_unretained __block id blockself = self;

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSUInteger seconds = 3;
		while (seconds > 0) {
			NSLog(@"%d", seconds--);
			sleep(1);
		}
		NSLog(@"Boom!");
		NSLog(@"%@", blockself);
	});
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
	LogStacktrace();

#ifdef DO_NOT_USE_ARC
	NSLog(@"I shouldn't be called in ARC");
	[super dealloc];
#endif
}

+ (void)load
{
	DumpMethods(self);
}

@end
