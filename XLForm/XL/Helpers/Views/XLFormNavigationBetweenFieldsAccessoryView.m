//
//  XLFormDefaultInputAccessoryView.m
//  XLForm
//
//  Created by Gaston Borba on 3/4/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "XLFormNavigationBetweenFieldsAccessoryView.h"


@interface XLFormNavigationBetweenFieldsAccessoryView ()
@property (nonatomic, strong) UIToolbar *toolBar;

@property (nonatomic, strong) UIBarButtonItem *previousButton;
@property (nonatomic, strong) UIBarButtonItem *fixedSpace;
@property (nonatomic, strong) UIBarButtonItem *nextButton;
@property (nonatomic, strong) UIBarButtonItem *flexibleSpace;
@property (nonatomic, strong) UIBarButtonItem *doneButton;

@end

@implementation XLFormNavigationBetweenFieldsAccessoryView

@synthesize toolBar = _toolBar;
@synthesize previousButton = _previousButton;
@synthesize nextButton = _nextButton;
@synthesize doneButton = _doneButton;

- (id)init
{
    return [self initCustom];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initCustom];
}

-(id)initCustom
{
    self = [super initWithFrame:CGRectMake(0, 0, [self getDefaultWidth], [self getDefaultHeight])];
    if (self) {
        [self addSubview:self.toolBar];
    }
    return self;
}

#pragma mark - Properties

-(UIBarButtonItem *)previousButton
{
    if (_previousButton) return _previousButton;
#warning 105 is undocumented, it could get your app rejected from the app store
    _previousButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:105 target:self action:@selector(previousButtonTapped:)];
    return _previousButton;
}

-(UIBarButtonItem *)fixedSpace
{
    if (_fixedSpace) return _fixedSpace;
    _fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    _fixedSpace.width = 22.0;
    return _fixedSpace;
}

-(UIBarButtonItem *)nextButton
{
    if (_nextButton) return _nextButton;
#warning 106 is undocumented, it could get your app rejected from the app store
    _nextButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:106 target:self action:@selector(nextButtonTapped:)];
    return _nextButton;
}

-(UIBarButtonItem *)flexibleSpace
{
    if (_flexibleSpace) return _flexibleSpace;
    _flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    return _flexibleSpace;
}

-(UIBarButtonItem *)doneButton
{
    if (_doneButton) return _doneButton;

    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonTapped:)];
    return _doneButton;
}

- (UIToolbar *)toolBar
{
    if (_toolBar) return _toolBar;
    _toolBar = [[UIToolbar alloc] initWithFrame:self.frame];
    
     [_toolBar setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth)];

    NSArray * items = [NSArray arrayWithObjects:self.previousButton,
                                                self.fixedSpace,
                                                self.nextButton,
                                                self.flexibleSpace,
                                                self.doneButton, nil];
    
    [_toolBar setItems:items];
    return _toolBar;
}

#pragma mark - Actions

-(void)previousButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(previous:)])
    {
        [self.delegate previous:self];
    }
}

-(void)nextButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(next:)])
    {
        [self.delegate next:self];
    }
}

- (void)doneButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(done:)])
    {
        [self.delegate done:self];
    }
}

#pragma mark - Enable / Disable 

-(void)enablePreviousButton:(BOOL)enable
{
    [self.previousButton setEnabled:enable];
}

-(void)enableNextButton:(BOOL)enable
{
    [self.nextButton setEnabled:enable];
}

#pragma mark - Helpers

-(CGFloat)getDefaultWidth
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return screenWidth;
}

-(CGFloat)getDefaultHeight
{
    return  44.0f;
}

@end
