#import <UIKit/UIKit.h>

@interface FormTableController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
}
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;
@end
