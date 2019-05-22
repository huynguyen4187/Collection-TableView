//
//  ModelVideo.m
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import "ModelVideo.h"

@implementation ModelVideo

- (instancetype)init:(NSString *)nameImage andChanel:(NSString *)nameChanel andImage:(NSData *)img andStatus:(bool *)status
{
    self = [super init];
    if (self) {
        self.nameImage = nameImage;
        self.nameChanel = nameChanel;
        self.img = img;
        self.status = status;
    }
    return self;
}
@end
