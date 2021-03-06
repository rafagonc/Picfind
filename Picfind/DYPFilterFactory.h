//
//  DYPFilterFactory.h
//  Picfind
//
//  Created by Banco Santander Brasil on 2/25/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYPPeriodFilter.h"
#import "DYPLocationFilter.h"
#import "DYPFaceRecognizerFilter.h"
#import "DYPNameFilter.h"
#import "DYPAlbumFilter.h"
#import "DYPFavoriteFilter.h"
#import "DYPFaceCountFilter.h"
#import "DYPLuminosityFilter.h"

@protocol DYPFilterFactory <NSObject>

-(id<DYPPeriodFilter>)periodFilterFrom:(NSDate *)startDate to:(NSDate *)endDate;
-(id<DYPLocationFilter>)locationFilterWith:(CLLocation *)location range:(NSInteger)range;
-(id<DYPFaceRecognizerFilter>)faceRecognizerFilterWithImages:(NSArray *)images andRects:(NSArray *)rects;
-(id<DYPNameFilter>)nameFilterForName:(NSString *)name;
-(id<DYPAlbumFilter>)albumFilterForAlbums:(id<NSCollection>)albums;
-(id<DYPFavoriteFilter>)favoriteFilterWithType:(DYPFavoriteFilterType)type;
-(id<DYPFaceCountFilter>)faceCountFilterWithCount:(NSInteger)count;
-(id<DYPLuminosityFilter>)luminosityFilterWithInitialValue:(CGFloat)initialValue andFinalValue:(CGFloat)finalValue;

@end
