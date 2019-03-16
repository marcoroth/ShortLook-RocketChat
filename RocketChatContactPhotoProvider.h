#import "ShortLook-API.h"

@interface RocketChatContactPhotoProvider : NSObject <DDNotificationContactPhotoProviding>
  - (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification;
@end
