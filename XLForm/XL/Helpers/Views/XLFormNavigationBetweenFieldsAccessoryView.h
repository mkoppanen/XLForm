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

@class XLFormNavigationBetweenFieldsAccessoryView;

@protocol XLFormNavigationBetweenFieldsDelegate <NSObject>

@optional
-(void)previousField:(XLFormNavigationBetweenFieldsAccessoryView *)sender;
-(void)nextField:(XLFormNavigationBetweenFieldsAccessoryView *)sender;
-(void)done:(XLFormNavigationBetweenFieldsAccessoryView *)sender;
@end


@interface XLFormNavigationBetweenFieldsAccessoryView : UIView

@property (nonatomic, weak) id<XLFormNavigationBetweenFieldsDelegate> delegate;

-(void)enablePreviousButton:(BOOL)enable;
-(void)enableNextButton:(BOOL)enable;

@end
