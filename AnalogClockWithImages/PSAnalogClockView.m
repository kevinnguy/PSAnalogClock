//
//  PSAnalogClock.m
//  AnalogClockWithImages
//
//  Created by Paul Samuels on 26/07/2011.
//  Copyright 2011 www.paul-samuels.com. All rights reserved.
//

#import "PSAnalogClockView.h"

#define degreesToRadians(deg) (deg / 180.0 * M_PI)

typedef enum {
  PSAnalogClockViewOptionNone        = 1 << 0, // Default to PSAnalogClockViewOptionSmoothHands
  PSAnalogClockViewOptionSmoothHands = 1 << 1, // Makes the second hand move in one continous smooth motion
  PSAnalogClockViewOptionClunkyHands = 1 << 2, // Makes the second hand move more like a classic analog clock
} PSAnalogClockViewOption;

@interface PSAnalogClockView ()

@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, assign) PSAnalogClockViewOption options;

@end

@implementation PSAnalogClockView

#pragma mark - Initializers

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.date = [NSDate date];
    self.options = PSAnalogClockViewOptionSmoothHands;
    
    CGRect imageViewFrame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    self.clockFaceImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    self.hourHandImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    self.minuteHandImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    self.secondHandImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    self.centerCapImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    
    [self addSubview:self.clockFaceImageView];
    [self addSubview:self.hourHandImageView];
    [self addSubview:self.minuteHandImageView];
    [self addSubview:self.secondHandImageView];
    [self addSubview:self.centerCapImageView];
    
    [self updateClockTimeAnimated:NO];
  }
  
  return self;
}

- (void)setDate:(NSDate *)date
{
  _date = date;
  
  NSCalendar *calendar = [NSCalendar currentCalendar];
  self.dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)
                                    fromDate:date];
}

- (void)updateClockTimeAnimated:(BOOL)animated
{ 
  void (^updateClocks)(void) = ^ {
    [self updateHoursHand];
    [self updateMinutesHand];
    [self updateSecondsHand];
  };
  
  if (animated) {
    CGFloat duration           = 1.f;
    UIViewAnimationCurve curve = UIViewAnimationCurveLinear;
    
    if (PSAnalogClockViewOptionClunkyHands & self.options) {
      duration = 0.3f;
      curve    = UIViewAnimationCurveEaseOut;
    }
    
    [UIView animateWithDuration:duration
                          delay:0.f
                        options:curve
                     animations:updateClocks
                     completion:nil];
  }
  else {
    updateClocks();
  }
}

- (void)updateHoursHand
{
  if (!self.hourHandImageView.image) {
    return;
  }
  
  int degreesPerHour   = 30;
  int degreesPerMinute = 0.5;
  
  int hoursFor12HourClock = self.dateComponents.hour % 12;
  
  float rotationForHoursComponent  = hoursFor12HourClock * degreesPerHour;
  float rotationForMinuteComponent = degreesPerMinute * self.dateComponents.minute;
  
  float totalRotation = rotationForHoursComponent + rotationForMinuteComponent;
  
  double hourAngle = degreesToRadians(totalRotation);
  
  self.hourHandImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, hourAngle);
}

- (void)updateMinutesHand
{
  if (!self.minuteHandImageView.image) {
    return;
  }
  
  int degreesPerMinute = 6;
  
  double minutesAngle = degreesToRadians(self.dateComponents.minute * degreesPerMinute);
  
  self.minuteHandImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, minutesAngle);
}

- (void)updateSecondsHand
{
  if (!self.secondHandImageView.image) {
    return;
  }
  
  int degreesPerSecond = 6;
  
  double secondsAngle = degreesToRadians(self.dateComponents.second * degreesPerSecond);
  
  self.secondHandImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, secondsAngle);
}


@end
