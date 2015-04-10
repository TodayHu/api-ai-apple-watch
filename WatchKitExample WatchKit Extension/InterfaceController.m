//
//  InterfaceController.m
//  WatchKitExample WatchKit Extension
//
//  Created by Kuragin Dmitriy on 09/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property(nonatomic, weak) IBOutlet WKInterfaceButton *button;
@property(nonatomic, weak) IBOutlet WKInterfaceImage *progressImage;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
}

- (IBAction)sendRequest:(id)sender
{
    [self showProgress];
    
    NSArray *suggestions = @[
                             @"Hello",
                             @"Weather"
                             ];
    
    [self presentTextInputControllerWithSuggestions:suggestions
                                   allowedInputMode:WKTextInputModePlain
                                         completion:^(NSArray *results) {
                                             if (results.count) {
                                                 NSDictionary *userInfo = @{
                                                                            @"text": [results firstObject],
                                                                            };
                                                 
                                                 [WKInterfaceController openParentApplication:userInfo
                                                                                        reply:^(NSDictionary *replyInfo, NSError *error) {
                                                                                            if (replyInfo[@"response"]) {
                                                                                                NSDictionary *response = replyInfo[@"response"];
                                                                                                NSString *text = response[@"result"][@"speech"];
                                                                                                
                                                                                                if (![text length]) {
                                                                                                    text = @"<empty response>";
                                                                                                }
                                                                                                
                                                                                                [self.button setTitle:text];
                                                                                            } else {
                                                                                                NSError *error = replyInfo[@"error"];
                                                                                                [self.button setTitle:[error localizedDescription]];
                                                                                            }
                                                                                            [self dismissProgress];
                                                                                        }];
                                             } else {
                                                 [self dismissProgress];
                                             }
                                         }];
}

- (void)showProgress
{
    [_button setHidden:YES];
    [_progressImage setHidden:NO];
    [_progressImage startAnimating];
}

- (void)dismissProgress
{
    [_button setHidden:NO];
    [_progressImage setHidden:YES];
    [_progressImage stopAnimating];
}

- (void)didDeactivate {
    [super didDeactivate];
}

@end



