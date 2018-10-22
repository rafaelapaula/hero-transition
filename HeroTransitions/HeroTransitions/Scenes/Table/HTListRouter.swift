//
//  HTListRouter.swift
//  HeroTransitions
//
//  Created by Rafaela Lourenço de Paula on 19/10/2018.
//  Copyright (c) 2018 Rafaela Lourenço de Paula. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  Edited by Rodrigo Soldi
//

protocol HTListRouterDelegate: HTGenericRouterDelegate {
    func toDetail()
}

class HTListRouter: HTListRouterDelegate {
    
    weak var viewController: HTListViewController?
  
    init(_ viewController: HTListViewController) {
        self.viewController = viewController
    }
    
    func toDetail() {
        let detailViewController = HTDetailViewController.instance
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}