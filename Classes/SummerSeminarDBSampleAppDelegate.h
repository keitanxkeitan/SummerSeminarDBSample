//
//  SummerSeminarDBSampleAppDelegate.h
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListViewController;
@class FMDatabase;

@interface SummerSeminarDBSampleAppDelegate : NSObject <UIApplicationDelegate> {
 @private
  UIWindow *window_;
  ListViewController *listViewController_;
  FMDatabase *db_;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ListViewController *listViewController;
@property (nonatomic, retain) FMDatabase *db;

@end
