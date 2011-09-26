//
//  TbTodoDao.h
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@class TbTodo;

// Data Access Object
@interface TbTodoDao : NSObject {
 @private
  FMDatabase *db_;  // データベース
}
@property (nonatomic, retain) FMDatabase *db;

- (id)init;
- (NSMutableArray *)select;
- (void)insertWithTodo:(TbTodo *)todo;
- (BOOL)deleteAt:(int)pk;

@end
