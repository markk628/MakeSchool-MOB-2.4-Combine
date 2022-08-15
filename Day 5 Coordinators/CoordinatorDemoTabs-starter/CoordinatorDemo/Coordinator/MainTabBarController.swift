//
//  MainTabBarController.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    var home : HomeCoordinator!
    var settings: SettingsCoordinator!
    var messages: MessagesCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        home = HomeCoordinator(navigationController: NavigationController(rootViewController: homeVC))
        
        let settingsVC = SettingsVC()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "message"), tag: 1)
        settings = SettingsCoordinator(navigationController: NavigationController(rootViewController: settingsVC))
        
        let messagesVC = MessagesVC()
        messagesVC.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(systemName: "gearshape"), tag: 2)
        messages = MessagesCoordinator(navigationController: NavigationController(rootViewController: messagesVC))
        
        viewControllers = [home.navigationController, settings.navigationController, messages.navigationController]
    }
    


}
