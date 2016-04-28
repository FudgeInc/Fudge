//
//  AddFriendsViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 4/13/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Contacts

class AddFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [CNContact] = []
    var selectedCell: CNContact!
    var friendList: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController!.navigationBar.topItem!.title = "Add Friends";
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        let store = CNContactStore()
        
        let status = CNContactStore.authorizationStatusForEntityType(.Contacts)
        if status == .Denied || status == .Restricted {
            // user previously denied, so tell them to fix that in settings
            return
        }
        
        // open it
        store.requestAccessForEntityType(.Contacts) { granted, error in
            guard granted else {
                dispatch_async(dispatch_get_main_queue()) {
                    // user didn't grant authorization, so tell them to fix that in settings
                    print(error)
                }
                return
            }
            
            // get the contacts
            
            self.contacts = [CNContact]()
            let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey, CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName)])
            do {
                try store.enumerateContactsWithFetchRequest(request) { contactEntry, stop in
                    self.contacts.append(contactEntry)
                }
            } catch {
                print(error)
            }
            
            // do something with the contacts array (e.g. print the names)
            
            let formatter = CNContactFormatter()
            formatter.style = .FullName
            for contactEntry in self.contacts {
                print(formatter.stringFromContact(contactEntry)!)
                self.tableView.reloadData()
            }
        }
        
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*if let contacts = contacts {*/
        print(contacts.count)
        return contacts.count
        /*} else {
         print("ZERO!!")
         return 0
         }*/
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        
        let formatter = CNContactFormatter()
        formatter.style = .FullName
        
        let contact = contacts[indexPath.row]
        cell.contact = contact
        
        let fullName = formatter.stringFromContact(contact)!
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedCell = contacts[indexPath.row] as CNContact
        if friendList.contains(selectedCell) {

            let alert = UIAlertController(title: "Duplicate Friend", message: "You have already added this friend to your list.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        } else {
            friendList.append(selectedCell)
            self.performSegueWithIdentifier("friendSegue", sender: nil)
        }
        
    }
    
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        
        let friendsViewController = segue.destinationViewController as! FriendsViewController
        
        friendsViewController.friends = friendList;
        print(friendsViewController.friends.count)
        
    }
    
}
