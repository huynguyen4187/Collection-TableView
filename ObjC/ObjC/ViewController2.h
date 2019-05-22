//
//  ViewController2.h
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelVideo.h"
#import "VideoTableViewCell.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewController2 : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *myTitle;
@property (weak, nonatomic) IBOutlet UITextField *myChanel;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UIButton *myBtnStatus;

@end

NS_ASSUME_NONNULL_END
