//
//  Item.h
//  TodoList-ObjC
//
//  Created by Juan Ceballos on 2/18/21.
//

@interface Item : NSObject

// properties
@property NSString *name;
@property NSString *topic;

// initializer
// otherwise will have to instance alloc init, and access properties
// init with name and topic
- (instancetype)initWithName: (NSString *)name andTopic: (NSString *)topic;

+ (NSArray *)fetchItems; // returns array Item.fetchItems

// methods

@end
