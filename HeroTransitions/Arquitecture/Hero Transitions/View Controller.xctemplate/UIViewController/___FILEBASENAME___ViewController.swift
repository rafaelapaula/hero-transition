//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  Edited by Rodrigo Soldi
//

import UIKit

protocol ___VARIABLE_sceneName___InteractorDelegate: class {
    func viewDidLoad(_ request: ___VARIABLE_sceneName___Scene.View.DidLoad.Request)
}

class ___VARIABLE_sceneName___ViewController: HTGenericViewController, ___VARIABLE_sceneName___ViewControllerDelegate {
    
    lazy var interactor: ___VARIABLE_sceneName___InteractorDelegate? = ___VARIABLE_sceneName___Interactor(self)
    lazy var router: ___VARIABLE_sceneName___RouterDelegate? = ___VARIABLE_sceneName___Router(self)
    
    // MARK: View lifecycle
    
    
    // MARK: Actions
    
    
    // Mark: Protocols
    
    
}

extension ___VARIABLE_sceneName___ViewController {
    
    public static var instance: ___VARIABLE_sceneName___ViewController {
        let storyboard = UIStoryboard(name: String(describing: ___VARIABLE_sceneName___ViewController.self), bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? ___VARIABLE_sceneName___ViewController else {
            fatalError("ViewController must be exists to load scene.")
        }
        return viewController
    }
    
}
