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
        
//        let ref = Database.database().reference(fromURL: "https://gameofchats-bb5b0.firebaseio.com/")
//        ref.updateChildValues(["someValue": 2317])
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }

    @objc func handleLogout() {
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

   
}

