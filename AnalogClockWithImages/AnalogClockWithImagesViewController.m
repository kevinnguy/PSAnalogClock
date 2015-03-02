//
//  AnalogClockWithImagesViewController.m
//  AnalogClockWithImages
//
//  Created by Paul Samuels on 26/07/2011.
//  Copyright 2011 www.paul-samuels.com. All rights reserved.
//

#import "AnalogClockWithImagesViewController.h"
#import "PSAnalogClockView.h"

@interface AnalogClockWithImagesViewController ()

@property (nonatomic, strong) PSAnalogClockView *clockView;

@end

@implementation AnalogClockWithImagesViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self instantiateClockAndAddImagesAfterAndDoNotStartAnimation];
  [self instantiateClockAndAddImagesAfterWithSomeImagesMissing];
}


- (void)instantiateClockAndAddImagesAfterAndDoNotStartAnimation
{
  PSAnalogClockView *analogClock = [[PSAnalogClockView alloc] initWithFrame:CGRectMake(220, 20, 80, 80)];
  analogClock.clockFaceImageView.image  = [UIImage imageNamed:@"clock"];
  analogClock.hourHandImageView.image   = [UIImage imageNamed:@"clock_hour_hand"];
  analogClock.minuteHandImageView.image = [UIImage imageNamed:@"clock_minute_hand"];
  analogClock.secondHandImageView.image = [UIImage imageNamed:@"clock_second_hand"];
  analogClock.centerCapImageView.image  = [UIImage imageNamed:@"clock_centre_point"];
  
  [self.view addSubview:analogClock];
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateClock:)];
  [analogClock addGestureRecognizer:tap];
  
  self.clockView = analogClock;
  
  [analogClock updateClockTimeAnimated:YES];
}

- (void)updateClock:(id)sender
{
  [self.clockView updateClockTimeAnimated:YES];
}

- (void)instantiateClockAndAddImagesAfterWithSomeImagesMissing
{
  PSAnalogClockView *analogClock = [[PSAnalogClockView alloc] initWithFrame:CGRectMake(220, 138, 80, 80)];
    analogClock.hourHandImageView.image   = [UIImage imageNamed:@"clock_hour_hand"];
    analogClock.minuteHandImageView.image = [UIImage imageNamed:@"clock_minute_hand"];
    analogClock.secondHandImageView.image = [UIImage imageNamed:@"clock_second_hand"];
    analogClock.centerCapImageView.image  = [UIImage imageNamed:@"clock_centre_point"];
  
  [self.view addSubview:analogClock];
  
    [analogClock updateClockTimeAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
