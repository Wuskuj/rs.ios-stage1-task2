#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    int hour = hours.intValue;
    int minute = minutes.intValue;
    
    if (minute < 0 || minute >= 60 || hour < 0 || hour > 12) {
        return @"";
    }
    
    NSMutableString *string = [NSMutableString new];
    if (minute == 0) {
        switch (hour) {
            case 0:
            case 1: [string appendString:@"one o' clock"]; break;
            case 2: [string appendString:@"two o' clock"]; break;
            case 3: [string appendString:@"three o' clock"]; break;
            case 4: [string appendString:@"four o' clock"]; break;
            case 5: [string appendString:@"five o' clock"]; break;
            case 6: [string appendString:@"six o' clock"]; break;
            case 7: [string appendString:@"seven o' clock"]; break;
            case 8: [string appendString:@"eight o' clock"]; break;
            case 9: [string appendString:@"nine o' clock"]; break;
            case 10: [string appendString:@"ten o' clock"]; break;
            case 11: [string appendString:@"eleven o' clock"]; break;
            case 12: [string appendString:@"twelve o' clock"]; break;
            default:
                break;
        }
    }else if (minute >= 1 && minute <= 30) {
        if (minute == 1) {
            [string appendString:@"one minute past "];
            [string appendString:[self functionForHours:hour]];
        } else if (minute == 15) {
            [string appendString:@"quarter past "];
            [string appendString:[self functionForHours:hour]];
            
        }else if (minute == 30) {
            [string appendString:@"half past "];
            [string appendString:[self functionForHours:hour]];
        } else {
            [string appendString:[self someFunc:minute]];
            [string appendString:@"minutes past "];
            [string appendString: [self functionForHours:hour]];
        }
        
    }else {
        if (minute == 45) {
            [string appendString:@"quarter to "];
            [string appendString:[self functionForHours:hour + 1]];
        }else {
            int oneHour = 60;
            int resultMinutes = oneHour - minute;
            [string appendString:[self someFunc:resultMinutes]];
            [string appendString:@"minutes to "];
            [string appendString: [self functionForHours:hour + 1]];
    }
    }
    
    
    return string;
}

-(NSMutableString *)functionForHours : (int) hour {
    NSMutableString *string = [NSMutableString new];
    switch (hour) {
        case 1: [string appendString:@"one"]; break;
        case 2: [string appendString:@"two"]; break;
        case 3: [string appendString:@"three"]; break;
        case 4: [string appendString:@"four"]; break;
        case 5: [string appendString:@"five"]; break;
        case 6: [string appendString:@"six"]; break;
        case 7: [string appendString:@"seven"]; break;
        case 8: [string appendString:@"eight"]; break;
        case 9: [string appendString:@"nine"]; break;
        case 10: [string appendString:@"ten"]; break;
        case 11: [string appendString:@"eleven"]; break;
        case 12: [string appendString:@"twelve"]; break;
        default:
            break;
    }
    return string;
}


-(NSMutableString *)someFunc: (int) number {
    NSMutableString *string = [NSMutableString new];
    
    switch (number / 10) {
        case 2: string = [NSMutableString stringWithString:@"twenty "]; break;
        case 3: string = [NSMutableString stringWithString:@"thirty "]; break;
        case 4: string = [NSMutableString stringWithString:@"forty "]; break;
        case 5: string = [NSMutableString stringWithString:@"fifty "]; break;
        default:
            break;
    }
    if (number >= 10 && number < 20) {
        switch (number) {
            case 10: string = [NSMutableString stringWithString:@"ten "]; break;
            case 11: string = [NSMutableString stringWithString:@"eleven "]; break;
            case 12: string = [NSMutableString stringWithString:@"twelve "]; break;
            case 13: string = [NSMutableString stringWithString:@"thirteen "]; break;
            case 14: string = [NSMutableString stringWithString:@"fourteen "]; break;
            case 15: string = [NSMutableString stringWithString:@"fifteen "]; break;
            case 16: string = [NSMutableString stringWithString:@"sixteen "]; break;
            case 17: string = [NSMutableString stringWithString:@"seventeen "]; break;
            case 18: string = [NSMutableString stringWithString:@"eighteen "]; break;
            case 19: string = [NSMutableString stringWithString:@"nineteen "]; break;
            default:
                break;
        }
    }else {
        switch (number % 10) {
            case 1: [string appendString:@"one "]; break;
            case 2: [string appendString:@"two "]; break;
            case 3: [string appendString:@"three "]; break;
            case 4: [string appendString:@"four "]; break;
            case 5: [string appendString:@"five "]; break;
            case 6: [string appendString:@"six "]; break;
            case 7: [string appendString:@"seven "]; break;
            case 8: [string appendString:@"eight "]; break;
            case 9: [string appendString:@"nine "]; break;
            default:
                break;
        }
    }
    
    return string;
}

@end
