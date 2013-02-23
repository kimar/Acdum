//
//  AppDelegate.m
//  Acdum
//
//  Created by Marcus Kida on 23.02.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Let MagicalRecord do the Core Data stuff for us ;-)
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"mystore.sqlite"];

    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    // Empty our Database and fill it with Mock-Data
    [MagicalRecord saveUsingCurrentThreadContextWithBlock:^(NSManagedObjectContext *localContext) {
        
        [Shop truncateAllInContext:localContext];
        [Product truncateAllInContext:localContext];
        
        /*
            Initializing first Shop with three products...
         */
        
        Shop *pFirstShop = [Shop createInContext:localContext];
        pFirstShop.name = @"Aunt Emma's Shop";
        pFirstShop.address = @"123 Fakestreet";
        
        Product *pFirstProduct = [Product createInContext:localContext];
        pFirstProduct.name = @"Jelly Beans";
        pFirstProduct.ammount = [NSNumber numberWithInt:12];
        pFirstProduct.price = [NSNumber numberWithDouble:.99f];
        pFirstProduct.details = @"Delicious, sweet, Jelly Beans.";
        pFirstProduct.shop = pFirstShop;
        
        Product *pSecondProduct = [Product createInContext:localContext];
        pSecondProduct.name = @"Burrito Longo";
        pSecondProduct.ammount = [NSNumber numberWithInt:5];
        pSecondProduct.price = [NSNumber numberWithDouble:2.5f];
        pSecondProduct.details = @"The longest Burrito in Town!";
        pSecondProduct.shop = pFirstShop;

        Product *pThirdProduct = [Product createInContext:localContext];
        pThirdProduct.name = @"Brownie";
        pThirdProduct.ammount = [NSNumber numberWithInt:23];
        pThirdProduct.price = [NSNumber numberWithDouble:1.7f];
        pThirdProduct.details = @"250% chocolate...";
        pThirdProduct.shop = pFirstShop;
        
        /*
            ...and our second Shop with just one product.
         */
        
        Shop *pSecondShop = [Shop createInContext:localContext];
        pSecondShop.name = @"Kida's Apple Reseller Store";
        pSecondShop.address = @"EXPO Plaza 123";
        
        Product *pFourthProduct = [Product createInContext:localContext];
        pFourthProduct.name = @"MacBook Wheel";
        pFourthProduct.ammount = [NSNumber numberWithInt:1];
        pFourthProduct.price = [NSNumber numberWithDouble:1389.0f];
        pFourthProduct.details = @"No screen and only one Button!";
        pFourthProduct.shop = pSecondShop;

    } completion:^(BOOL success, NSError *error) {

        NSLog(@"Added Products and Shop %@ !", success?@"successfully":@"unsuccessful");
        
    }];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
