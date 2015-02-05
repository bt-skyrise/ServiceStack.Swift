//
//  AppDelegate.swift
//  TechStacks
//
//  Created by Demis Bellot on 2/2/15.
//  Copyright (c) 2015 ServiceStack LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.translucent = false
        navigationBarAppearace.tintColor = UIColor.whiteColor()
        navigationBarAppearace.barTintColor = UIColor(red: 0.0, green: 0.58431372550000005, blue: 0.96078431369999995, alpha: 1.0)
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    var appData = AppData()
}

extension UIView
{
    var appData:AppData {
        return (UIApplication.sharedApplication().delegate as AppDelegate).appData
    }
}
extension UIViewController
{
    var appData:AppData {
        return (UIApplication.sharedApplication().delegate as AppDelegate).appData
    }
}

extension CGFloat
{
    public func toHexColor(rgbValue:UInt32) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
}


/*
public static Stream Resize(Image img, int newWidth, int newHeight)
{
if (newWidth != img.Width || newHeight != img.Height)
{
var ratioX = (double)newWidth / img.Width;
var ratioY = (double)newHeight / img.Height;
var ratio = Math.Max(ratioX, ratioY);
var width = (int)(img.Width * ratio);
var height = (int)(img.Height * ratio);

var newImage = new Bitmap(width, height);
Graphics.FromImage(newImage).DrawImage(img, 0, 0, width, height);
img = newImage;

if (img.Width != newWidth || img.Height != newHeight)
{
var startX = (Math.Max(img.Width, newWidth) - Math.Min(img.Width, newWidth)) / 2;
var startY = (Math.Max(img.Height, newHeight) - Math.Min(img.Height, newHeight)) / 2;
img = Crop(img, newWidth, newHeight, startX, startY);
}
}

var ms = new MemoryStream();
img.Save(ms, ImageFormat.Png);
ms.Position = 0;
return ms;
}
*/


extension UIImage
{
    func scaledInto(bounds:CGSize) -> UIImage
    {
        var scaledSize:CGSize = bounds

        let ratioX = bounds.width / self.size.width
        let ratioY = bounds.height / self.size.height
        let useRatio = min(ratioX, ratioY)
        
        scaledSize.width = self.size.width * useRatio
        scaledSize.height = self.size.height * useRatio
        
        UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
        var scaledImageRect = CGRectMake(0.0, 0.0, scaledSize.width, scaledSize.height)
        self.drawInRect(scaledImageRect)
        var scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}

