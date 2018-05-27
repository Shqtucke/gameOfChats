//
//  NewMessageController.swift
//  GameOfChats
//
//  Created by Shaun Tucker on 5/27/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    let cellid = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchUser()
        
    }
    //MARK: - VERY IMPORTANT!!!
    func fetchUser() {
        
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            print(snapshot)
        }, withCancel: nil)
    }

    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        
        cell.textLabel?.text = "Shawn will succeed"
        
        return cell
    }

}
