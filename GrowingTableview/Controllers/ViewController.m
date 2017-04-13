//
//  ViewController.m
//  GrowingTableview
//
//  Created by -Vishal on 13/04/17.
//  Copyright © 2017 Vishal. All rights reserved.
//

#import "ViewController.h"
#import "DataCell.h"


@interface ViewController () <DataCellDelegate>
{
    NSMutableArray *arr;
    int btnX;
    
    NSInteger rowCount,startRowCount;
    BOOL isExpanded;
    NSInteger noOfMagsCount;
    
    NSIndexPath *expandedIndexPath;
    NSInteger tapedMagIndex;
    
    NSMutableDictionary *dicParent;
}

@end

@implementation ViewController

#pragma mark - ViewLife Cycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    arr = [NSMutableArray arrayWithObjects:@{@"Name":@"A"},
           @{@"Name":@"B"},
           @{@"Name":@"C"},
           @{@"Name":@"D"},
           @{@"Name":@"E"},
           @{@"Name":@"F"},
           @{@"Name":@"G"},
           @{@"Name":@"H"},
           @{@"Name":@"I"},
           @{@"Name":@"J"},
           @{@"Name":@"K"},
           nil] ;
    dicParent = [[NSMutableDictionary alloc] init];
    rowCount = ceilf(arr.count/4.0f);
    
    //Add Image
    if (rowCount >1) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setObject:@"Tap" forKey:@"Name"];
        
        [arr insertObject:dic atIndex:3];
    }
    
    //Set Dictionary
    for (int i = 0; i < rowCount; i++)
    {
        NSMutableArray *magArr = [[NSMutableArray alloc] init];
        for (int j = 0; j < 4; j++) {
            
            if (noOfMagsCount < arr.count) {
                [magArr addObject:arr[noOfMagsCount]];
            }
            noOfMagsCount++;
            
            if (j == 3) {
                [dicParent setObject:magArr forKey:[NSString stringWithFormat:@"%d", i]];
            }
        }
    }
    
    //Row Count Set
    if (rowCount >1) {
        startRowCount = 1;
    }
    
    [tblView setContentInset:UIEdgeInsetsMake(1, 0, 0, 0)];
}

#pragma mark - UITableViewDataSource / UITableViewDelegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat headerHeight = 1;
    if (indexPath.section == 1) {
        headerHeight = 80;
    }
    else
    {
        headerHeight = 50;
    }
    return headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger noOfRow;
    switch (section)
    {
        case 0:
            noOfRow = 0;
            break;
        case 1:
            noOfRow = isExpanded ?rowCount:startRowCount;
            break;
        default:
            break;
    }
    return noOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    switch (indexPath.section) {
        case 0:
        {
            static NSString *cellIdentifier = @"Cell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            return cell;
        }
            break;
        case 1:
        {
            static NSString *CellIdentifier = @"DataCell";
            
            DataCell *cell = [tblView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            if (!cell) {
                cell = [[DataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            [cell configureCellWithData:[dicParent objectForKey:[NSString stringWithFormat:@"%ld", (long)indexPath.row]] forIndexPath:indexPath withDelegate:self];
            
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

-(void)taped:(NSMutableArray *)dataObj withIndex:(NSInteger)index ofIndexPath:(NSIndexPath *)indexPathToBeExpanded
{
    if (!isExpanded) {
        
        isExpanded = YES;
        
        tapedMagIndex = index;
        expandedIndexPath = indexPathToBeExpanded;
        
        [tblView beginUpdates];
        for (int i = 1; i<rowCount; i++) {
            [tblView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:expandedIndexPath.row+i inSection:1]] withRowAnimation:UITableViewRowAnimationTop];
            [tblView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:expandedIndexPath.row inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
        }
        
        [tblView endUpdates];
    }
    else
    {
        if (indexPathToBeExpanded.row == expandedIndexPath.row && tapedMagIndex == index) {
            
            isExpanded = NO;
            tapedMagIndex = 0;
            
            [tblView beginUpdates];
            for (int i = 1; i < rowCount; i++)
            {
                [tblView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:expandedIndexPath.row+i inSection:1]] withRowAnimation:UITableViewRowAnimationTop];
            }
            [tblView endUpdates];
            expandedIndexPath = nil;
        }
    }
}

#pragma mark - Memory Management
#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
