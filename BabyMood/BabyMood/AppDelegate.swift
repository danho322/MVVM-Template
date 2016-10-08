//
//  AppDelegate.swift
//  BabyMood
//
//  Created by Daniel on 9/23/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ViewModelServicesDelegate {

    var window: UIWindow?
    var services: ViewModelServicesProtocol?
    
    var presenting: UIViewController? {
        return navigationStack.peekAtStack()
    }
    
    private var navigationStack: [UIViewController] = []
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Window, services, root VC
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Root view controller
        services = ViewModelServices(delegate: self)
//        let vm = TodoTableViewModel(services: services!)
//        services?.push(vm)
        
        let rootNavigationController = UINavigationController()
        navigationStack.push(rootNavigationController)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: ViewModelServicesDelegate
    
    func services(services: ViewModelServicesProtocol, navigate: NavigationEvent) {
        dispatch_async(dispatch_get_main_queue()) {
            switch navigate {
            case .Push(let vc, let style):
                switch style {
                case .Push:
                    if let top = self.presenting as? UINavigationController {
                        top.pushViewController(vc, animated: true)
                    }
                case .Modal:
                    if let top = self.presenting {
                        let navc = self.wrapNavigation(vc)
                        self.navigationStack.push(navc)
                        top.presentViewController(navc, animated: true, completion: nil)
                    }
                }
            case .Pop:
                if let navc = self.presenting as? UINavigationController {
                    if navc.viewControllers.count > 1 {
                        navc.popViewControllerAnimated(true)
                    } else if self.navigationStack.count > 1 {
                        // There's only one VC in the navigation controller and we're not popping the root, so we must be looking at a modal. Pop the modal.
                        self.navigationStack.pop()?.dismissViewControllerAnimated(true, completion: nil)
                    }
                } else {
                    // Not a navigation controller at top of stack, so cannot be root.
                    self.navigationStack.pop()?.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    private func wrapNavigation(vc: UIViewController) -> UINavigationController {
        let navc = UINavigationController(rootViewController: vc)
        navc.navigationBar.translucent = false
        return navc
    }

}

