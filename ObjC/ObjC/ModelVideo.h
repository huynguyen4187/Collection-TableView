//
//  ModelVideo.h
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelVideo : NSObject

@property (nonatomic,strong) NSData *img;
@property (nonatomic,strong) NSString *nameImage;
@property (nonatomic,strong) NSString *nameChanel;
@property (nonatomic) bool status;

@end

NS_ASSUME_NONNULL_END
