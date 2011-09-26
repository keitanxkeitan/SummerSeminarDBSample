//
//  TbTodo.m
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import "TbTodo.h"


@implementation TbTodo
@synthesize pk = pk_;
@synthesize task = task_;
@synthesize priority = priority_;

- (id)initWithPk:(int)pk task:(NSString *)task priority:(int)priority {
  self = [super init];
  if (self) {
    pk_ = pk;
    task_ = [task copy];
    priority_ = priority;
  }
  return self;
}

- (void)dealloc {
  [task_ release];
  [super dealloc];
}

@end
