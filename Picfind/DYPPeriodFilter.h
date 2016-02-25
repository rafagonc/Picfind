//
//  DYPPeriodFilter.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilter.h"

@protocol DYPPeriodFilter <DYPFilter>

-(NSDate *)from;
-(NSDate *)to;

@end
