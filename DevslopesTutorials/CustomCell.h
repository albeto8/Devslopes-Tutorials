//
//  CustomCell.h
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 25/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface CustomCell : UITableViewCell
-(void)updateUI:(nonnull Video*)video;
@end
