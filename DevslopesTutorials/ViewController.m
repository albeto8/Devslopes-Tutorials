//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Mario Alberto Barragán Espinosa on 24/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "CustomCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            //NSLog(@"Dictionary: %@", dataArray.debugDescription);
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dict in dataArray) {
                Video *video = [[Video alloc]init];
                video.videoTitle = [dict objectForKey:@"title"];
                video.videoDescription = [dict objectForKey:@"description"];
                video.thumbnailUrl = [dict objectForKey:@"thumbnail"];
                video.videoIframe = [dict objectForKey:@"iframe"];
                
                [arr addObject:video];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            //Display alert to user
        }
    }];
}

-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomCell alloc]init];
    }
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
