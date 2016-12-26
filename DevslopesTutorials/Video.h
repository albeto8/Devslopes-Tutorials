//
//  Video.h
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 25/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic,strong) NSString *videoTitle;
@property(nonatomic,strong) NSString *videoDescription;
@property(nonatomic,strong) NSString *videoIframe;
@property(nonatomic,strong) NSString *thumbnailUrl;
@end
