//
//  Product.h
//  Acdum
//
//  Created by Marcus Kida on 23.02.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Shop;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * ammount;
@property (nonatomic, retain) Shop *shop;

@end
