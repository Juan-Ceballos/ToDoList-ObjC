//
//  Item.m
//  TodoList-ObjC
//
//  Created by Juan Ceballos on 2/18/21.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@implementation Item

- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
    if (self = [super init]) {
        // initialize all properties here
        self.name = name;
        self.topic = topic;
    }
    return self;
}

+ (NSArray *)fetchItems {
    return @[
        [[Item alloc] initWithName:@"Interview with Audible" andTopic:@"DSA"],
        [[Item alloc] initWithName:@"Peer Coding with Mentor" andTopic:@"Technical Interview"],
        [[Item alloc] initWithName:@"SuShare Project" andTopic:@"iOS"],
        [[Item alloc] initWithName:@"Throw out trash" andTopic:@"Clean"],
        [[Item alloc] initWithName:@"ObjectiveC Lecture" andTopic:@"obj-c"]

    ];
}

@end
