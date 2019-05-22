//
//  ViewController.m
//  ObjC
//
//  Created by Nguyen Hoang Huy on 5/20/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

#import "ViewController.h"
#import "VideoTableViewCell.h"
#import "ModelVideo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell =( VideoTableViewCell *)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    ModelVideo *video = [_arrdata objectAtIndex: indexPath.row];
    cell.myImage.image = [UIImage imageWithData: video.img];
    cell.myTitle.text = video.nameImage;
    cell.myChanel.text = video.nameChanel;
    if(video.status == true){
        cell.myStatus.text = @"Đã đăng ký";
    }
    else{
        cell.myStatus.text = @"Chưa đăng ký";
    }

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_arrdata.count > 0) {
        return _arrdata.count;
    }
    else return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}
//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end

@implementation UIView (Border)

@dynamic addBorderTop;
@dynamic addBorderBottom;
@dynamic addBorderLeft;
@dynamic addBorderRight;

- (void) setAddBorderTop: (CGFloat)newValue
{
    [self addBorderUtility:0 y:0 width:self.frame.size.width height:newValue color:self.layer.borderColor];
}

- (void) setAddBorderBottom: (CGFloat) newValue
{
    [self addBorderUtility:0 y:self.frame.size.height - newValue width:self.frame.size.width height:newValue color:self.layer.borderColor];
}

- (void) setAddBorderLeft: (CGFloat) newValue
{
    [self addBorderUtility:0 y:0 width:newValue height:self.frame.size.height color:self.layer.borderColor];
}

- (void) setAddBorderRight: (CGFloat) newValue
{
    [self addBorderUtility:self.frame.size.width - newValue y:0 width:newValue height:self.frame.size.height color:self.layer.borderColor];
}

- (void) addBorderUtility:(CGFloat)x y:(CGFloat)y width:(CGFloat)width  height:(CGFloat)height color:(CGColorRef)color
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color;
    border.frame = CGRectMake(x, y, width, height);
    [self.layer addSublayer:border];
}
@end
