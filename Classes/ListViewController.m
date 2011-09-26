//
//  ListViewController.m
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import "ListViewController.h"
#import "TbTodoDao.h"
#import "TbTodo.h"
#import "AddViewController.h"

@interface ListViewController (PrivateMethod)
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)edit:(id)sender;
- (void)done:(id)sender;
- (void)add:(id)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)dealloc;
@end

@implementation ListViewController (PrivateMethod)

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"ToDo List";
  
  tbTodoDao_ = [[TbTodoDao alloc] init];
  records_ = [[tbTodoDao_ select] retain];
  tableView_.delegate = self;
  tableView_.dataSource = self;
  
  self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                         target:self
                                                                                         action:@selector(edit:)] autorelease];
  self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                          target:self
                                                                                          action:@selector(add:)] autorelease];
}

- (void)viewWillAppear:(BOOL)animated {
  [records_ autorelease];
  records_ = [[tbTodoDao_ select] retain];
  [tableView_ reloadData];
}

- (void)edit:(id)sender {
  [tableView_ setEditing:YES animated:YES];
  
  self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                         target:self
                                                                                         action:@selector(done:)] autorelease];
}

- (void)done:(id)sender {
  [tableView_ setEditing:NO animated:YES];
  
  self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                         target:self
                                                                                         action:@selector(edit:)] autorelease];
}

- (void)add:(id)sender {
  AddViewController *addViewController = [[AddViewController alloc] init];
  [self presentModalViewController:addViewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    TbTodo *todo = (TbTodo *)[records_ objectAtIndex:indexPath.row];
    [records_ removeObjectAtIndex:indexPath.row];
    
    [tbTodoDao_ deleteAt:[todo pk]];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:indexPath];
    [tableView deleteRowsAtIndexPaths:array
                     withRowAnimation:UITableViewRowAnimationFade];
  }
}

- (void)dealloc {
  [tbTodoDao_ release];
  [records_ release];
  [super dealloc];
}

@end

@implementation ListViewController
@synthesize tableView = tableView_;
@synthesize editButton = editButton_;
@synthesize addButton = addButton_;
@synthesize tbTodoDao = tbTodoDao_;
@synthesize records = records_;

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return [records_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TbTodo *todo = (TbTodo *)[records_ objectAtIndex:indexPath.row];
  NSString *CellIdentifier = todo.task;
  
  UITableViewCell *cell = 
  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero
                                   reuseIdentifier:CellIdentifier] autorelease];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %d",
                           todo.task,
                           todo.priority];
  }
  return cell;
}

@end
