//
//  XLFormDefaultInputAccessoryView.h
//  XLForm
//
//  Created by Gaston Borba on 3/4/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    XLFormNavigationBetweenFieldsDirectionPrevious = 0,
    XLFormNavigationBetweenFieldsDirectionNext
} XLFormNavigationBetweenFieldsDirection;


@interface XLFormNavigationBetweenFieldsAccessoryView : UIView

@property (nonatomic, strong) UIBarButtonItem *previousButton;
@property (nonatomic, strong) UIBarButtonItem *nextButton;
@property (nonatomic, strong) UIBarButtonItem *doneButton;

@end
