//
//  AddViewController.m
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import "AddViewController.h"
#import "TbTodo.h"
#import "TbTodoDao.h"

@interface AddViewController (PrivateMethod)
- (void)add:(id)sender;
- (void)dealloc;
@end

@implementation AddViewController (PrivateMethod)

- (void)add:(id)sender {
  TbTodo *todo = [[TbTodo alloc] initWithPk:-1
                                       task:taskTextField_.text
                                   priority:[priorityTextField_.text intValue]];
  [tbTodoDao_ insertWithTodo:todo];
  [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
  [tbTodoDao_ release];
  [super dealloc];
}

@end

@implementation AddViewController
@synthesize taskTextField = taskTextField_;
@synthesize priorityTextField = priorityTextField_;
@synthesize addButton = addButton_;
@synthesize tbTodoDao = tbTodoDao_;

- (id)init {
  self = [super init];
  if (self) {
    tbTodoDao_ = [[TbTodoDao alloc] init];
  }
  return self;
}

@end
