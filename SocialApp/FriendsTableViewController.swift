//
//  FriendsTableViewController.swift
//  SocialApp
//
//  Created by Anna on 01.05.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [User] = [] {
        didSet {
            friends.sort { (u1, u2) -> Bool in
                return u1.name < u2.name
            }
            
            sections = []
            for user in friends {
                let letter = String(user.name.first!)
                if !sections.contains(letter) {
                    sections.append(letter)
                    sectionsFriends.append([])
                }
                sectionsFriends[sectionsFriends.count - 1].append(user)
            }
            
            tableView.reloadData()
        }
    }
    
    var sections: [String] = []
    var sectionsFriends: [[User]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        friends = [
            User(name: "Алиса", age: 10, avatar: UIImage(named: "cat1")!, photos: [
                UIImage(named: "cat1")!,
                UIImage(named: "cat2")!,
                UIImage(named: "cat3")!,
            ]),
            User(name: "Ася", age: 10, avatar: UIImage(named: "cat1")!, photos: [
                UIImage(named: "cat1")!,
                UIImage(named: "cat2")!,
                UIImage(named: "cat3")!,
            ]),
            User(name: "Вениамин", age: 10, avatar: UIImage(named: "cat1")!, photos: [
                UIImage(named: "cat1")!,
                UIImage(named: "cat2")!,
                UIImage(named: "cat3")!,
            ]),
            User(name: "Маша", age: 10, avatar: UIImage(named: "cat1")!, photos: [
                UIImage(named: "cat1")!,
                UIImage(named: "cat2")!,
                UIImage(named: "cat3")!,
            ]),
            User(name: "Вениамин", age: 10, avatar: UIImage(named: "cat1")!, photos: [
                UIImage(named: "cat1")!,
                UIImage(named: "cat2")!,
                UIImage(named: "cat3")!,
            ]),
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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionsFriends[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)

        if let cell = cell as? FriendTableViewCell {
            let friend = sectionsFriends[indexPath.section][indexPath.row]
            
            cell.nameLabel.text = friend.name
            cell.ageLabel.text = String(friend.age)
            cell.avatarView.imageView.image = friend.avatar
            cell.tag = indexPath.row
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.backgroundView?.alpha = 0.7
        }
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
