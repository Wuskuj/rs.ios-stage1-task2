#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = day.intValue;
    dateComponents.month = month.intValue;
    dateComponents.year = year.intValue;
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];

    if(![dateComponents isValidDateInCalendar:calendar]) {
        return @"Такого дня не существует";
    } else {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd MMMM, EEEE";
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        NSDate *date = [calendar dateFromComponents:dateComponents];
        NSString *finalDate = [dateFormatter stringFromDate:date];
        return finalDate;
    }
}

@end
