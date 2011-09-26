//
//  ListViewController.h
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TbTodoDao;

@interface ListViewController : UIViewController<UITableViewDataSource,
                                                 UITableViewDelegate> {
 @private
  UITableView *tableView_;
  UIBarButtonItem *editButton_;
  UIBarButtonItem *addButton_;
  TbTodoDao *tbTodoDao_;
  NSMutableArray *records_;
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *editButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, retain) TbTodoDao *tbTodoDao;
@property (nonatomic, copy) NSMutableArray *records;

@end
