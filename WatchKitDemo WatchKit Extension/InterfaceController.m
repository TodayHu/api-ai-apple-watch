//
//  InterfaceController.m
//  WatchKitDemo WatchKit Extension
//
//  Created by Kuragin Dmitriy on 13/04/15.
//  Copyright (c) 2015 Kuragin Dmitriy. All rights reserved.
//

#import "InterfaceController.h"


#import <ApiAI/WatchKit/AIWatchKitTextRequest.h>

@interface InterfaceController()

@property(nonatomic, weak) IBOutlet WKInterfaceButton *button;
@property(nonatomic, weak) IBOutlet WKInterfaceImage *progressImage;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (IBAction)sendRequest:(id)sender
{
    [self showProgress];
    
    NSArray *suggestions = @[
                             @"Hello",
                             ];
    
    [self presentTextInputControllerWithSuggestions:suggestions
                                   allowedInputMode:WKTextInputModePlain
                                         completion:^(NSArray *results) {
                                             if (results.count) {
                                                 AIWatchKitTextRequest *textRequest = [[AIWatchKitTextRequest alloc] init];
                                                 
                                                 textRequest.query = @[results.firstObject];
                                                 
                                                 [textRequest runWithCompletionWithSuccesfull:^(id response) {
                                                     NSString *text = response[@"result"][@"speech"];
                                                     
                                                     if (![text length]) {
                                                         text = @"<empty response>";
                                                     }
                                                     
                                                     [self.button setTitle:text];
                                                     
                                                     [self dismissProgress];
                                                 } andFailure:^(NSError *error) {
                                                     [self.button setTitle:[error localizedDescription]];
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
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



