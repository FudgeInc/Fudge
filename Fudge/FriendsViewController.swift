//
//  FriendsViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Contacts

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(friends.count)
        return friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        
        let formatter = CNContactFormatter()
        formatter.style = .FullName
        
        let friend = friends[indexPath.row]
        cell.contact = friend
        
        let fullName = formatter.stringFromContact(friend)!
        let nameArray = fullName.componentsSeparatedByString(" ")
        
        if nameArray.count == 1 {
            cell.firstName.text = nameArray[0]
            cell.middleName.text = ""
            cell.lastName.text = ""
        } else if nameArray.count == 2 {
            cell.firstName.text = nameArray[0]
            cell.middleName.text = nameArray[1]
            cell.lastName.text = ""
        } else if nameArray.count == 3 {
            cell.firstName.text = nameArray[0]
            cell.middleName.text = nameArray[1]
            cell.lastName.text = nameArray[2]
        }
        
        return cell
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        let addFriendsViewController = segue.destinationViewController as! AddFriendsViewController
        
        addFriendsViewController.friendList = friends;
        print(addFriendsViewController.friendList.count)
        
     }
    
}
