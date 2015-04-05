//
//  ViewController.m
//  Whatever
//
//  Created by Hayden Lalljie on 4/4/15.
//  Copyright (c) 2015 Hayden Lalljie. All rights reserved.
//

#import "ViewController.h"

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface ViewController ()

//Wheel
@property (weak, nonatomic) IBOutlet UIButton *TriadButton;
@property (weak, nonatomic) IBOutlet UIButton *Enemy;
@property (weak, nonatomic) IBOutlet UIButton *Character;
@property (nonatomic) UIView *TriadView;
@property (nonatomic) UIImageView *LowScreenBackground;



@end

CGFloat ScreenWidth;
CGFloat ScreenHeight;
CGFloat degrees = 1;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[_TriadView addSubview:_TriadButton ];
    //[self.view addSubview:_TriadView ];
    //ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    //ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    //[self CreateEnemy];
    
    
}

- (void)CreateEnemy
{
    //NSLog(@"Enetered Create Enemy");\
    //NSLog(@"Character Center: %@", NSStringFromCGPoint(_Character.center));
    //NSLog(@"Enemy Center Before: %@", NSStringFromCGPoint(_Enemy.center));
    {
        [UIView animateWithDuration:5 animations:^{
            [[self Enemy] setCenter: [_Character center]];
        } completion:^(BOOL finished) {
        NSLog(@"Animation Finished");
        }];
    }
    //NSLog(@"Enemy Center After: %@", NSStringFromCGPoint(_Enemy.center));
}

- (IBAction)PressTriad:(id)sender {
    //CGPoint tc = _TriadButton.center;
    [self TriadButton].layer.anchorPoint = CGPointMake(.34085777, .517578125);
    //NSLog(@"Triad Point: %@", NSStringFromCGPoint(tc));
    //NSLog(@"Triad Frame X: %f", _TriadButton.frame.size.width/2);
    //NSLog(@"Triad Frame Y: %f", _TriadButton.frame.size.width/2);
    //NSLog(@"Anchor Point: %@", NSStringFromCGPoint([_TriadButton layer].anchorPoint));
    //_TriadButton.layer.anchorPoint = CGPointMake(tc.x +_TriadButton.frame.size.width/2 ,tc.y + _TriadButton.frame.size.height/2);
    //NSLog(@"Anchor Point: %@", NSStringFromCGPoint([_TriadButton layer].anchorPoint));

    /*[UIView animateWithDuration:1 animations:^{
        _TriadButton.transform = CGAffineTransformMakeRotation(  120 / 180.0 * M_PI);
        //_TriadButton.transform = CGAffineTransformMakeRotation(  10000 / 180.0 * M_PI);
    } completion:^(BOOL finished) {
        //NSLog(@"Animation Finished");
    }];*/
    //[self rotateButton:_TriadButton duration: 2.0 curve:UIViewAnimationCurveEaseIn degrees: 120];
    
    #define DEGREES_TO_RADIANS(x) (x * M_PI/180.0)
    [self TriadButton].center = CGPointMake(35, 435);
    CGAffineTransform rotation = CGAffineTransformMakeRotation( DEGREES_TO_RADIANS(120 * degrees++) );
    self.TriadButton.transform = rotation;
    
    //[self TriadButton].layer.anchorPoint = CGPointMake(.5, .5);
    //_TriadButton.transform = CGAffineTransformMakeRotation( 120 / 180.0 * M_PI);
    //NSLog(@"Triad Pressed");
    //[self CreateEnemy];
}

- (void)rotateButton:(UIButton *)button duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    button.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
