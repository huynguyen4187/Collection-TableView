//
//  TableViewCell.h
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myTitle;
@property (weak, nonatomic) IBOutlet UILabel *myChanel;
@property (weak, nonatomic) IBOutlet UIImageView *myLogoChanel;
@property (weak, nonatomic) IBOutlet UILabel *myStatus;

@end

NS_ASSUME_NONNULL_END
