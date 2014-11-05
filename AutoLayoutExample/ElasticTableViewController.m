//
//  ElasticTableViewController.m
//  AutoLayoutExample
//
//  Created by Andre Cytryn on 11/5/14.
//
//

#import "ElasticTableViewController.h"
#import "ElasticCell.h"

@interface ElasticTableViewController () {
    NSString *itemDescription;
    int cellHeight;
}

@end

@implementation ElasticTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // temp data
    itemDescription = @"Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.";
    cellHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cellHeight > 80) {
        return cellHeight;
    }
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ElasticCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ElasticCell" forIndexPath:indexPath];
    
    cell.textLabel.text = itemDescription;
    
    return cell;
}


- (IBAction)readMoreButtonTapped:(UIButton *)button {
    if ([button.titleLabel.text isEqualToString:@"HIDE"]) {
        cellHeight = 80;
        [button setTitle:@"READ MORE" forState:UIControlStateNormal];
    } else {
        CGSize maximumLabelSize = CGSizeMake(280,2000);
        CGRect labelRect = [itemDescription
                            boundingRectWithSize:maximumLabelSize
                            options:NSStringDrawingUsesLineFragmentOrigin
                            attributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica Neue" size:17]}
                            context:nil];
        cellHeight = 80 + labelRect.size.height;
        
        if (cellHeight > 80) {
            [button setTitle:@"HIDE" forState:UIControlStateNormal];
        } else {
            [UIButton animateWithDuration:0.3 animations:^{
                button.alpha = 0;
                button.enabled = NO;
            }];
        }
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}


@end
