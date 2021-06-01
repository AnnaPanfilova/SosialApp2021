//
//  GroupsSerachTableViewController.swift
//  SocialApp
//
//  Created by Anna on 01.05.2021.
//

import UIKit

class GroupsSerachTableViewController: UITableViewController {
    
    var groups = [
        Group(name: "Кошачья мята 2", image: UIImage(named: "group1")!),
        Group(name: "Молочная кухня 2", image: UIImage(named: "group2")!),
        Group(name: "Стоп-Пёс 2!", image: UIImage(named: "group3")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "group", for: indexPath)

        if let cell = cell as? GroupSearchTableViewCell {
            let group = groups[indexPath.row]
            cell.avatarImageView.image = group.image
            cell.nameLabel.text = group.name
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

}
