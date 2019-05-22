//
//  ViewController.h
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSMutableArray *arrdata;


@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@interface UIView (Border)
@property (nonatomic) IBInspectable CGFloat addBorderTop;
@property (nonatomic) IBInspectable CGFloat addBorderBottom;
@property (nonatomic) IBInspectable CGFloat addBorderLeft;
@property (nonatomic) IBInspectable CGFloat addBorderRight;


@end
