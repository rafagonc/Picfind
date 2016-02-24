//
//  DYPFilterCreatorDelegate.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/24/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPFilter.h"

@protocol DYPFilterCreatorDelegate <NSObject>

-(void)source:(id)source didCreateFilter:(id<DYPFilter>)filter;


@end
