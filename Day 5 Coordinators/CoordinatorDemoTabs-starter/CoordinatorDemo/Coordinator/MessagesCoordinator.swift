//
//  MessagesCoordinator.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/8/21.
//

import Foundation
import UIKit

class MessagesCoordinator {
    
    var navigationController: NavigationController
    private var rootVC: MessagesVC?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
        self.rootVC = navigationController.viewControllers.first as? MessagesVC
        
    }
    
    func start() {
        rootVC!.coordinator = self
        navigationController.pushViewController(rootVC!, animated: true)
    }
}
