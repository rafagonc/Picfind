//
//  DYPFilterFactoryImpl.m
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPFilterFactoryImpl.h"
#import "DYPLocationFilterImpl.h"
#import "DYPPeriodFilterImpl.h"

@implementation DYPFilterFactoryImpl

#pragma mark - creation
-(id<DYPFilter>)locationFilterWith:(CLLocation *)location range:(NSInteger)range {
    return [[DYPLocationFilterImpl alloc] initWithLocation:location andRange:range];
}
-(id<DYPFilter>)periodFilterFrom:(NSDate *)startDate to:(NSDate *)endDate {
    return [[DYPPeriodFilterImpl alloc] initWithFirstDate:startDate andLastDate:endDate];
}

@end
