//
//  LoginViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNScanViewController.h"

#import "OCNManualEntryViewController.m"


@import AVFoundation;

@interface OCNScanViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) UIView *videoPreviewView;


@end

@implementation OCNScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addManualButton {
    UIButton *manualButton = [UIButton buttonWithType:UIButtonTypePlain];
    manualButton.layer.zPosition = 100000;
    
    [manualButton setTitle:@"Manual" forState:UIControlStateNormal];
    [manualButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    manualButton.titleLabel.font = [OCNTheme sharedTheme].bodyFont;
    
    [manualButton addTarget:self action:@selector(switchToManual:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [AutolayoutHelper configureView:self.videoPreviewView
                           subViews:NSDictionaryOfVariableBindings(manualButton)
                        constraints:@[@"H:|-[manualButton]",
                                      @"V:|-[manualButton]"]];
    
}

- (void)switchToManual : (id)sender {
    UIViewController *vc = [[OCNManualEntryViewController alloc]init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startReading];
}


-(void)startReading {
    NSError *error;
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        NSLog(@"Chances are this is is being done in the simulator, don't do that.");
        return;
    }
    self.videoPreviewView = [[UIView alloc]initWithFrame:self.view.layer.bounds];
    [self addManualButton];
    [self.view addSubview:self.videoPreviewView];
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("com.oceans.qr_code", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:self.view.layer.bounds];
    [self.videoPreviewView.layer addSublayer:_videoPreviewLayer];
    [_captureSession startRunning];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            [_captureSession stopRunning];
            NSString *string = metadataObj.stringValue;
            
            
            
            
            [_captureSession stopRunning];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UILabel *accessCodeLabel = [UILabel new];
                accessCodeLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:30];
                accessCodeLabel.text = string;
                accessCodeLabel.textColor = [UIColor whiteColor];
                
                accessCodeLabel.layer.shadowOpacity = 1.0;
                accessCodeLabel.layer.shadowRadius = 0.0;
                accessCodeLabel.layer.shadowColor = [UIColor blackColor].CGColor;
                accessCodeLabel.layer.shadowOffset = CGSizeMake(-1.0, -2.0);
                accessCodeLabel.translatesAutoresizingMaskIntoConstraints = NO;
                
                NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:accessCodeLabel
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier:1
                                                                            constant:0];
                
                NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:accessCodeLabel
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1
                                                                            constant:0];
                
                [self.view addSubview:accessCodeLabel];
                [self.view addConstraint:centerX];
                [self.view addConstraint:centerY];
                [self.view layoutIfNeeded];
                centerY.constant = (self.view.frame.size.height / 2 + accessCodeLabel.frame.size.height/2) * -1;
                [UIView animateWithDuration:1.5 animations:^{
                    [self.view layoutIfNeeded];
                    accessCodeLabel.transform = CGAffineTransformScale(accessCodeLabel.transform, 0.35, 0.35);
                } completion:^(BOOL finished) {
                    //if it hasn't finished by now there's clearly an issue so we'll start reading again.
                    [self startReading];
                }];
            });
        }
    }
}

-(void)dismissSelfToNextView: (BOOL)continueToNextView{
    [_captureSession stopRunning];
    _captureSession = nil;
    _videoPreviewView = nil;
    if(!continueToNextView) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)dismissView : (UIBarButtonItem *)barButtonItem {
    [self dismissSelfToNextView:NO];
}



@end
