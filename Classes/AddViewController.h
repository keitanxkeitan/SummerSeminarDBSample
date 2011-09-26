//
//  AddViewController.h
//  SummerSeminarDBSample
//
//  Created by keitanxkeitan on 11/09/24.
//  Copyright 2011 jcfarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TbTodoDao;

@interface AddViewController : UIViewController {
 @private
  UITextField *taskTextField_;
  UITextField *priorityTextField_;
  UIButton *addButton_;
  TbTodoDao *tbTodoDao_;
}
@property (nonatomic, retain) IBOutlet UITextField *taskTextField;
@property (nonatomic, retain) IBOutlet UITextField *priorityTextField;
@property (nonatomic, retain) IBOutlet UIButton *addButton;
@property (nonatomic, retain) TbTodoDao *tbTodoDao;

@end
