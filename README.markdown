AnalogClockWithImages
---------------------

This project is a quick example of how to use `PSAnalogClockView` which is a class that allows you to create an analog style clock by providing your own images.

The class accepts images for:

- The clock face
- The hour hand
- The minute hand
- The second hand
- A center cap piece that covers the point where all the hands intercept

The class can be instantiated by:

    PSAnalogClockView *analogClock = [[PSAnalogClockView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    analogClock.hourHandImageView.image   = [UIImage imageNamed:@"clock_hour_hand"];
    analogClock.minuteHandImageView.image = [UIImage imageNamed:@"clock_minute_hand"];
    analogClock.secondHandImageView.image = [UIImage imageNamed:@"clock_second_hand"];
    analogClock.centerCapImageView.image  = [UIImage imageNamed:@"clock_centre_point"];

    [self.view addSubview:analogClock];

    [analogClock updateClockTimeAnimated:YES];