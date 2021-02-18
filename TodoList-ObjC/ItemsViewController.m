//
//  ViewController.m
//  TodoList-ObjC
//
//  Created by Juan Ceballos on 2/18/21.
//

#import "ItemsViewController.h"
#import "Item.h"

// conform to UITableViewDataSource
@interface ItemsViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property NSMutableArray *items;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self confiugureNavBar];
    self.items = [[NSMutableArray alloc] initWithArray:[Item fetchItems]];
    self.TableView.dataSource = self;
}

- (void)confiugureNavBar {
    // 1. create an image for the nav bar button item
    UIImage *image = [UIImage systemImageNamed:@"plus"];
    // 2. create bar button item
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(addItem)];
    
    // set the plus button as the right bar button item
    self.navigationItem.rightBarButtonItem = plusButton;
    self.navigationItem.title = @"To Do List";
}

- (void)addItem {
    // 1. initialize an alert controller
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add a new to do list item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    // 2. add 2 textFields to the alert controller
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // code here
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // code here
    }];
    
    alertController.textFields[0].placeholder = @"Enter the name of the item";
    alertController.textFields[1].placeholder = @"Enter the topic";
    
    // 4. define action items cancel and save
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // handler code here
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // handler code here
        // 1. insert new item
        NSString *name = alertController.textFields[0].text;
        NSString *topic = alertController.textFields[1].text;
        
        Item *newItem = [[Item alloc] initWithName:name andTopic:topic];
        [self.items addObject:newItem];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count - 1 inSection:0];
        
        [self.TableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    }];
    
    // 5. add actions to the alert controller
    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    Item *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.topic;
    return cell;
    
    
}


@end
