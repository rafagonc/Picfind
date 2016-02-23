//
//  DYPAssetCell.h
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYPAssetProtocol.h"

@interface DYPAssetCell : UICollectionViewCell

@property (nonatomic,weak) id<DYPAssetProtocol> asset;

@end
