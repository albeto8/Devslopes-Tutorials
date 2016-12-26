//
//  HTTPService.h
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 24/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
