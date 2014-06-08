//
//  AutoLayoutController.m
//  AutoLayoutDemo
//
//  http://www.appcoda.com/swipeable-uitableviewcell-tutorial/
//
//  Created by Kevin Nick on 2014-6-7.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "AutoLayoutController.h"

#import "AutoLayoutTableCell.h"

@interface AutoLayoutController ()

@property(strong, nonatomic) NSArray *dataSection;
@property(strong, nonatomic) NSMutableArray *dataArray;

@property(weak, nonatomic) IBOutlet UITableView *autoLayoutTableView;

@end

@implementation AutoLayoutController

- (void)viewDidLoad {
  [super viewDidLoad];

  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
    self.autoLayoutTableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
  }

  [self initData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initData {
  self.dataSection =
      [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
  self.dataArray = [[NSMutableArray alloc] init];

  for (int i = 0; i < self.dataSection.count; ++i) {
    [self.dataArray addObject:[NSMutableArray array]];
  }

  for (int i = 0; i < 100; ++i) {
    NSString *string = [NSString stringWithFormat:@"%d", i];
    [self.dataArray[i % self.dataSection.count] addObject:string];
  }
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  AutoLayoutTableCell *cell = [self.autoLayoutTableView
      dequeueReusableCellWithIdentifier:@"AutoLayoutTableCell"
                           forIndexPath:indexPath];

  cell.leftUtilityButtons = [self leftButtons];
  cell.rightUtilityButtons = [self rightButtons];
  cell.label.text =
      [NSString stringWithFormat:@"Section: %ld, Seat: %ld",
                                 (long)indexPath.section, (long)indexPath.row];
  cell.delegate = self;

  return cell;
}

- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  return self.dataSection[section];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [self.dataArray[section] count];
}

#pragma mark SWTableViewCell

- (NSArray *)rightButtons {
  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  [rightUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                             title:@"More"];
  [rightUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                             title:@"Delete"];

  return rightUtilityButtons;
}

- (NSArray *)leftButtons {
  NSMutableArray *leftUtilityButtons = [NSMutableArray new];

  [leftUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                              icon:[UIImage imageNamed:@"check.png"]];
  [leftUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                              icon:[UIImage imageNamed:@"clock.png"]];
  [leftUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                              icon:[UIImage imageNamed:@"cross.png"]];
  [leftUtilityButtons
      sw_addUtilityButtonWithColor:
          [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                              icon:[UIImage imageNamed:@"list.png"]];

  return leftUtilityButtons;
}

@end
