//
//  SummerSeminarDBSampleAppDelegate.m
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import "SummerSeminarDBSampleAppDelegate.h"
#import "ListViewController.h"
#import "FMDatabase.h"

@interface SummerSeminarDBSampleAppDelegate (PrivateMethod)
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)dealloc;
- (BOOL)initDatabase;
@end

@implementation SummerSeminarDBSampleAppDelegate (PrivateMethod)

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
  if (![self initDatabase]) {
    NSLog(@"Failed to initialize database.");
  }
  UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:listViewController_];
  [window_ addSubview:nc.view];
  [self.window makeKeyAndVisible];
  return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
  [window_ release];
  [listViewController_ release];
  [db_ release];
  [super dealloc];
}

- (BOOL)initDatabase {
  BOOL success;
  NSError *error;
  NSFileManager *fm = [NSFileManager defaultManager];
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask,
                                                       YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *writableDBPath = [documentsDirectory
                              stringByAppendingPathComponent:@"todo.db"];
  
  success = [fm fileExistsAtPath:writableDBPath];
  if (!success) {
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath]
                               stringByAppendingPathComponent:@"todo.db"];
    success = [fm copyItemAtPath:defaultDBPath
                          toPath:writableDBPath
                           error:&error];
    if (!success) {
      NSLog(@"%@", [error localizedDescription]);
    }
  }
  
  if (success) {
    db_ = [[FMDatabase databaseWithPath:writableDBPath] retain];
    if ([db_ open]) {
      [db_ setShouldCacheStatements:YES];
    } else {
      NSLog(@"Failed to open database.");
      success = NO;
    }
  }
  return success;
}

@end


@implementation SummerSeminarDBSampleAppDelegate

@synthesize window = window_;
@synthesize listViewController = listViewController_;
@synthesize db = db_;

@end
