//
//  HTTPService.m
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 24/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

@end
