//
//  AppDelegate.h
//  cconverter
//
//  Created by Ivan Kalita on 03.07.17.
//  Copyright © 2017 Ivan Kalita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKCRateUpdater.h"

@interface IKCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IKCRateUpdater *rateUpdater;

@end

