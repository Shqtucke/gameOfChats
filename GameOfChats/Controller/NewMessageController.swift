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
    var users = [UserO]()
    
    var dbReference: DatabaseReference?
    var dbHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchUser()
        
    }
    //MARK: - VERY IMPORTANT!!!
    func fetchUser() {
        
//        Database.database().reference().child("users").observe(.childAdded) { (snapshot: DataSnapshot) in
//
//           print(snapshot.value)
//
//        }

        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in

            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = UserO()
                //user.setValuesForKeys(dictionary)
                user.name = (dictionary["name"] as! String)
                user.email = dictionary["email"] as? String
                self.users.append(user)
                DispatchQueue.main.async() {
                    self.tableView.reloadData()
                }
              print(user.name!, user.email!)
            }
//            print("user found")
//            print(snapshot)
        }, withCancel: nil)
    }

    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }

}









