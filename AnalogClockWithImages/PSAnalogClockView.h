//
//  PSAnalogClock.h
//  AnalogClockWithImages
//
//  Created by Paul Samuels on 26/07/2011.
//  Copyright 2011 www.paul-samuels.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSAnalogClockView : UIView
@property (nonatomic, strong) UIImageView *secondHandImageView;
@property (nonatomic, strong) UIImageView *minuteHandImageView;
@property (nonatomic, strong) UIImageView *hourHandImageView;
@property (nonatomic, strong) UIImageView *clockFaceImageView;
@property (nonatomic, strong) UIImageView *centerCapImageView;

@property (nonatomic, strong) NSDate *date;


- (id)initWithFrame:(CGRect)frame;
- (void)updateClockTimeAnimated:(BOOL)animated;

@end
