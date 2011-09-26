//
//  TbTodo.h
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import <Foundation/Foundation.h>

// Data Transfer Object
@interface TbTodo : NSObject {
 @private
  int pk_;          // プライマリキー
  NSString *task_;  // タスク
  int priority_;    // プライオリティ
}
@property (nonatomic, assign) int pk;
@property (nonatomic, copy) NSString *task;
@property (nonatomic, assign) int priority;

- (id)initWithPk:(int)pk task:(NSString *)task priority:(int)priority;

@end
