//
//  DataCell.h
//  DemoHomeMenu
//
//  Created by -Vishal on 18/03/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataCellDelegate <NSObject>

- (void)taped:(NSDictionary *)dataObj withIndex:(NSInteger)index ofIndexPath:(NSIndexPath *)indexPathToBeExpanded;

@end

@interface DataCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *lbl01;
@property (nonatomic, strong) IBOutlet UILabel *lbl02;
@property (nonatomic, strong) IBOutlet UILabel *lbl03;
@property (nonatomic, strong) IBOutlet UILabel *lbl04;

@property (nonatomic, strong) IBOutlet UIButton *btn01;
@property (nonatomic, strong) IBOutlet UIButton *btn02;
@property (nonatomic, strong) IBOutlet UIButton *btn03;
@property (nonatomic, strong) IBOutlet UIButton *btn04;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, readwrite) NSInteger tapedMagIndex;

@property (nonatomic, assign) NSArray *magArr;
@property (nonatomic, assign) id<DataCellDelegate> delegate;

- (void)configureCellWithData:(NSArray *)magArr forIndexPath:(NSIndexPath *)indexPath withDelegate:(id<DataCellDelegate>)delegate;

@end
