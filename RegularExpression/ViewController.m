//
//  ViewController.m
//  RegularExpression
//
//  Created by tigerfly on 2020/5/15.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, OperatorType) {
    OperatorTypeChineseTelecomOperator = 0,
    OperatorTypeChinaMobileOperator,
    OperatorTypeChinaUnicomOperator
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Pattern Match
    
    [self filtersAndSort];
    
    
}


/// Pattern Match
- (void)matchStringByPattern {
    /// NSScanner
    /// NSRegulerExpression
    /// NSDataDetector
    /// NSTextCheckingResult
    /// NSNotFound
    
    NSString *pattern = @"^[0-9A-Za-z.]$";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
}


/// Filters
///
- (void)filtersAndSort {
    /// NSPredicate
    /// NSSortDescriptor
    /// NSComparisonResult
    
    NSString *inputString = @"103-23";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like[c] %@",@"[a-z]{9}"];
    BOOL result = [predicate evaluateWithObject:inputString];
    if (!result) {
        NSLog(@"not match");
    }
    
    NSString *testNumber = @"13637473222";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",[self chinesePhoneNumberCheck:OperatorTypeChineseTelecomOperator]];
    NSPredicate *phonePredicate_1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",[self chinesePhoneNumberCheck:OperatorTypeChinaMobileOperator]];
    NSPredicate *phonePredicate_2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",[self chinesePhoneNumberCheck:OperatorTypeChinaUnicomOperator]];


    BOOL phoneSuit = [phonePredicate evaluateWithObject:testNumber];
    BOOL phoneSuit_1 = [phonePredicate_1 evaluateWithObject:testNumber];
    BOOL phoneSuit_2 = [phonePredicate_2 evaluateWithObject:testNumber];

    if ([phonePredicate evaluateWithObject:testNumber] || [phonePredicate_1 evaluateWithObject:testNumber] || [phonePredicate_2 evaluateWithObject:testNumber]) {
        NSLog(@"phone number is suitable");
    }
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES];
    
    
}

/// common check
/// ==> phone | email
/// Chinese telecom operators： [133、153、173、177、180、181、189、191、193、199]
/// China mobile  operator：【134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、172、178、182、183、184、187、188、198】
/// China Unicom operator：【130、131、132、155、156、166、175、176、185、186】

- (NSString *)chinesePhoneNumberCheck:(OperatorType)type {
    NSString *chineseOperator = nil;
    switch (type) {
        case OperatorTypeChineseTelecomOperator:
            chineseOperator = @"^1(3[3]|5[3]|7[37]|8[019]|9[139])\\d{8}$";
            break;
        case OperatorTypeChinaUnicomOperator:
            chineseOperator = @"^1(3[012]|5[56]|6[6]|7[56]|8[56])\\d{8}$";
            break;
        case OperatorTypeChinaMobileOperator:
            chineseOperator = @"^1((3[5-9]|4[7]|5[0-279]|7[28]|8[2-478]|9[8])\\d|34[0-8])\\d{7}$";
            break;
    }
    return chineseOperator;
}

@end
