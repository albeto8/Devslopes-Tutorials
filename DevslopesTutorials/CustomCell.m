//
//  CustomCell.m
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 25/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import "CustomCell.h"
#import "Video.h"

@interface CustomCell ()
@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0 / 255.0 green:157.0 / 255.0 blue:157.0 / 255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

-(void)updateUI:(nonnull Video*)video {
    self.titleLabel.text = video.videoTitle;
    self.descriptionLabel.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailUrl]]];
    
    self.videoImageView.image = image;
}

@end
