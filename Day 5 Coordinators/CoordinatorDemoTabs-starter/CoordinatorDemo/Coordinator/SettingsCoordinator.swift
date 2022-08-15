//
//  SettingsCoordinator.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/8/21.
//

import Foundation
import UIKit

class SettingsCoordinator {
    
    var navigationController: NavigationController
    private var rootVC: SettingsVC?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
        self.rootVC = navigationController.viewControllers.first as? SettingsVC
        
    }
    
    func start() {
        rootVC!.coordinator = self
        navigationController.pushViewController(rootVC!, animated: true)
    }
}
