#import "RocketChatContactPhotoProvider.h"

@implementation RocketChatContactPhotoProvider
  - (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NSString *ejson = [notification.applicationUserInfo valueForKeyPath:@"ejson"];
    if (!ejson) return nil;
    NSData* data = [ejson dataUsingEncoding:NSUTF8StringEncoding];

    NSError *error = nil;
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];

    NSString *host = json[@"host"];
    NSString *username = json[@"sender"][@"username"];
    if (!host || !username) return nil;

    NSString *imageURLStr = [NSString stringWithFormat:@"%@avatar/%@", host, username];
    NSURL *imageURL = [NSURL URLWithString:imageURLStr];

    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:imageURLStr fromURL:imageURL];
  }
@end
