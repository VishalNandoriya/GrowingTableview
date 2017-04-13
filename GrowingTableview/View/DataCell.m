//
//  DataCell.m
//  DemoHomeMenu
//
//  Created by -Vishal on 18/03/16.
//  Copyright © 2016 . All rights reserved.
//

#import "DataCell.h"

@implementation DataCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configureCellWithData:(NSArray *)magArr forIndexPath:(NSIndexPath *)indexPath withDelegate:(id<DataCellDelegate>)delegate
{
    _indexPath = indexPath;
    _magArr = magArr;
    _delegate = delegate;
    [self hideNonRequiredMagsForMagsCount:magArr.count];

    switch (magArr.count) {
        case 1:
        {
            [_lbl01 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,1]];
            [_btn01 setTitle:[_magArr[0] valueForKey:@"Name"] forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
            [_lbl01 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,1]];
            [_btn01 setTitle:[_magArr[0] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            [_lbl02 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,2]];
            [_btn02 setTitle:[_magArr[1] valueForKey:@"Name"] forState:UIControlStateNormal];

        }
            break;
        case 3:
        {
            [_lbl01 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,1]];
            [_btn01 setTitle:[_magArr[0] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            [_lbl02 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,2]];
            [_btn02 setTitle:[_magArr[1] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            [_lbl03 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,3]];
            [_btn03 setTitle:[_magArr[2] valueForKey:@"Name"] forState:UIControlStateNormal];
        }
            break;
        case 4:
        {
            [_lbl01 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,1]];
            [_btn01 setTitle:[_magArr[0] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            [_lbl02 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,2]];
            [_btn02 setTitle:[_magArr[1] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            [_lbl03 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,3]];
            [_btn03 setTitle:[_magArr[2] valueForKey:@"Name"] forState:UIControlStateNormal];
            
            
            [_lbl04 setText:[NSString stringWithFormat:@"%ld %d",_indexPath.row,4]];
            [_btn04 setTitle:[_magArr[3] valueForKey:@"Name"] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
}
- (void)hideNonRequiredMagsForMagsCount:(NSInteger)magsCount
{
    switch (magsCount) {
        case 1: {

            [_lbl02 setHidden:YES];
            [_btn02 setHidden:YES];
            
            [_lbl03 setHidden:YES];
            [_btn03 setHidden:YES];
            
            [_lbl04 setHidden:YES];
            [_btn04 setHidden:YES];
            
        }
            break;
        case 2: {
            [_lbl03 setHidden:YES];
            [_btn03 setHidden:YES];
            
            [_lbl04 setHidden:YES];
            [_btn04 setHidden:YES];
        }
            break;
        case 3: {
            [_lbl04 setHidden:YES];
            [_btn04 setHidden:YES];
        }
            break;
        case 4: {
            [_lbl01 setHidden:NO];
            [_lbl02 setHidden:NO];
            [_lbl03 setHidden:NO];
            [_lbl04 setHidden:NO];
            
            [_btn01 setHidden:NO];
            [_btn02 setHidden:NO];
            [_btn03 setHidden:NO];
            [_btn04 setHidden:NO];
        }
            break;
        default:
            break;
    }
}

- (IBAction)magCoverTaped:(id)sender
{
    
    [_delegate taped:_magArr[[sender tag]-1] withIndex:[sender tag] ofIndexPath:_indexPath];
}
@end
