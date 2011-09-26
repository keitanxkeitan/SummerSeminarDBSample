//
//  TbTodoDao.m
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import "TbTodoDao.h"
#import "SummerSeminarDBSampleAppDelegate.h"
#import "TbTodo.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"


@implementation TbTodoDao
@synthesize db = db_;

- (id)init {
  self = [super init];
  if (self) {
    // AppDelegateでオープン済みのDatabaseを取得
    SummerSeminarDBSampleAppDelegate *appDelegate =
    (SummerSeminarDBSampleAppDelegate *)[[UIApplication sharedApplication] delegate];
    db_ = [appDelegate.db retain];
  }
  return self;
}

- (NSMutableArray *)select {
  NSMutableArray *result = [NSMutableArray array];
  FMResultSet *rs = [db_ executeQuery:@"SELECT * FROM todo "
                     @"ORDER BY priority DESC"];
  while ([rs next]) {
    TbTodo *tr = [[[TbTodo alloc] initWithPk:[rs intForColumn:@"pk"]
                                        task:[rs stringForColumn:@"task"]
                                    priority:[rs intForColumn:@"priority"]]
                  autorelease];
    [result addObject:tr];
  }
  [rs close];
  return result;
}

- (void)insertWithTodo:(TbTodo *)todo {
  [db_ executeUpdate:@"INSERT INTO todo (task, priority) VALUES (?, ?)",
   todo.task,
   [NSNumber numberWithInt:todo.priority]];
  if ([db_ hadError]) {
    NSLog(@"Error %d: %@", [db_ lastErrorCode], [db_ lastErrorMessage]);
  }
}

- (BOOL)deleteAt:(int)pk {
  BOOL success = YES;
  [db_ executeUpdate:@"DELETE FROM todo WHERE pk = ?",
   [NSNumber numberWithInt:pk]];
  if ([db_ hadError]) {
    NSLog(@"Error %d: %@", [db_ lastErrorCode], [db_ lastErrorMessage]);
    success = NO;
  }
  return success;
}

- (void)dealloc {
  [db_ release];
  [super dealloc];
}

@end
