//
//  ViewController.swift
//  GameOfChats
//
//  Created by Shaun Tucker on 5/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        //User not logged in
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
        }
    }
    
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
            
        } catch let logoutError {
            
            print(logoutError)
        }
        
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    
}

