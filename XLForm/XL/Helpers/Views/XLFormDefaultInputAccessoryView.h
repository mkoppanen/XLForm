//
//  XLFormDefaultInputAccessoryView.h
//  XLForm
//
//  Created by Gaston Borba on 3/4/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XLFormDefaultInputAccessoryView;

@protocol XLFormDefaultInputAccessoryViewDelegate <NSObject>

@optional
-(void)previous:(XLFormDefaultInputAccessoryView *)sender;
-(void)next:(XLFormDefaultInputAccessoryView *)sender;
-(void)done:(XLFormDefaultInputAccessoryView *)sender;
@end


@interface XLFormDefaultInputAccessoryView : UIView

@property (nonatomic, weak) id<XLFormDefaultInputAccessoryViewDelegate> delegate;

-(void)enablePreviousButton:(BOOL)enable;
-(void)enableNextButton:(BOOL)enable;

@end
