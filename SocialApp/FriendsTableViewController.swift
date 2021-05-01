//
//  FriendsTableViewController.swift
//  SocialApp
//
//  Created by Anna on 01.05.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friends = [
        User(name: "Василий", age: 10, avatar: UIImage(named: "cat1")!, photos: [
            UIImage(named: "cat1")!,
            UIImage(named: "cat2")!,
            UIImage(named: "cat3")!,
        ]),
        User(name: "Барсик", age: 12, avatar: UIImage(named: "cat2")!, photos: [
            UIImage(named: "cat3")!,
            UIImage(named: "cat4")!,
            UIImage(named: "cat5")!,
        ]),
        User(name: "Маркиз", age: 3, avatar: UIImage(named: "cat3")!, photos: [
            UIImage(named: "cat5")!,
            UIImage(named: "cat4")!,
            UIImage(named: "cat3")!,
        ]),
        User(name: "Мурка", age: 6, avatar: UIImage(named: "cat4")!, photos: [
            UIImage(named: "cat1")!,
            UIImage(named: "cat5")!,
            UIImage(named: "cat3")!,
        ]),
        User(name: "Мурзик", age: 11, avatar: UIImage(named: "cat5")!, photos: [
            UIImage(named: "cat2")!,
            UIImage(named: "cat1")!,
            UIImage(named: "cat3")!,
        ])
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
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)

        if let cell = cell as? FriendTableViewCell {
            let friend = friends[indexPath.row]
            
            cell.nameLabel.text = friend.name
            cell.ageLabel.text = String(friend.age)
            cell.avatarImageView.image = friend.avatar
            cell.tag = indexPath.row
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPhotos" {
            if let photosViewController = segue.destination as? PhotosCollectionViewController {
                let friendCell = sender as! FriendTableViewCell
                let friendNum = friendCell.tag
                let friend = friends[friendNum]
                
                photosViewController.photos = friend.photos
            }
        }
    }

}
