//
//  ViewController.swift
//  GameOfChats
//
//  Created by Shaun Tucker on 5/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }

    @objc func handleLogout() {
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

   
}

