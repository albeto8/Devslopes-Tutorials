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
#import "VideoVC.h"

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
    
    [[HTTPService instance]postComment];
}

-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomCell alloc]init];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    CustomCell *customCell = (CustomCell*)cell;
    [customCell updateUI:video];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"videoVC" sender:video];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoVC *vc = (VideoVC*)segue.destinationViewController;
    Video *video = (Video*)sender;
    
    vc.video = video;
}

@end
