Apple Watch helper Demo for apiai.
==============

## <a name="integratingintoyourapp"></a>Integrating into your app
### 1. See [apiai SDK Reference](https://github.com/api-ai/api-ai-ios-sdk/blob/master/README.md) for apiai initialization.
### 2. In the AppDelegate.m, add
  ```Objective-C
...
#import <ApiAIWatchKit/AIWatchKitHandler.h>
...
- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply
{
    if (![AIWatchKitHandler handleWatchKitRequest:userInfo andReply:reply]) {
        // you code for handle messages from watch
    }
}
...
  ```
### 3. Configure you Podfile like this:
  ```Podfile
...
# Pod for Apple Watch Extension target
pod 'ApiAIWatchKit/WatchKitForWatch'
...
# Pod for Phone application
pod 'ApiAIWatchKit/WatchKitForPhone'
...
  ```
### 4. In the InterfaceController of WatchKit Extension target add IBAction with following code:
  ```Objective-C
...
NSArray *suggestions = @[
                         ...
                         // you suggestions for text input
                         ...
                         ];

[self presentTextInputControllerWithSuggestions:suggestions
                               allowedInputMode:WKTextInputModePlain
                                     completion:^(NSArray *results) {
                                         if (results.count) {
                                             AIWatchKitTextRequest *textRequest = [[AIWatchKitTextRequest alloc] init];
                                             
                                             textRequest.query = @[results.firstObject];
                                             
                                             [textRequest runWithCompletionWithSuccesfull:^(id response) {
                                                 NSString *text = response[@"result"][@"speech"];
                                                 
                                                 // you handle response code
                                             } andFailure:^(NSError *error) {
                                                 // you handle error code
                                             }];
                                         }
                                     }];
...
  ```