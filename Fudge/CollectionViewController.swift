//
//  CollectionViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class CollectionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //TODO: Implement tableview

    @IBOutlet weak var tableView: UITableView!
    var actionSheet: UIAlertController!
    var collections: [Collection]! //the users collections to display in the table
    var user:PFUser! //TODO: we need to pass this in from login
    var hud = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set the delegate and datasource for tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension //set thiis so autolayout will decide the height
        tableView.estimatedRowHeight = 200
        
        //TODO: set the HUD color
        
        //set up the action sheet
        actionSheet = UIAlertController(title: "Add", message: "Add a Collection or Recipe", preferredStyle: .ActionSheet)
        
        //now make the buttons for the two options
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in
            print("Exiting Action Sheet...")
        }
        
        actionSheet.addAction(cancelButton)
        
        let addCollectionButton = UIAlertAction(title: "Add a Collection", style: .Default) { (UIAlertAction) in
            //perform a segue to the Add Collection View
            self.performSegueWithIdentifier("AddCollectionSegue", sender: nil)
        }
        
        actionSheet.addAction(addCollectionButton)
        
        let addRecipeButton = UIAlertAction(title: "Add a Recipe", style: .Default) { (UIAlertAction) in
            //perform a segue to the Add a Recipe View
            self.performSegueWithIdentifier("AddRecipeSegue", sender: nil)
        }
        
        actionSheet.addAction(addRecipeButton)
        
        hud.show(true)
        loadCollectionData()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadCollectionData()
    }
    
    func loadCollectionData(){
        
        //Now we get the collections the user has and add them to the collections array
        // Or using NSPredicate
        let userString = (PFUser.currentUser()?.username!)! as String
        let predicate = NSPredicate(format: "%@ IN collaborators", userString)
        let query = PFQuery(className: "Collection", predicate: predicate)
        //get all the arrays where the current user is a collaborator
        query.findObjectsInBackgroundWithBlock { (result:[PFObject]?, error:NSError?) in
            if let error = error{
                //if there's an error log the error and make collections an empty array
                NSLog(error.localizedDescription)
            }else{
                self.hud.hide(true)
                if let result = result{
                    //if there's no error proceed as usual
                    self.collections = Collection.getCollectionsFromArray(result)
                    //set the collection class variable
                    Collection.collections = self.collections
                    self.tableView.reloadData()
                }
                
            }
        }

    }
    /*******************/
    /*TableView Methods*/
    /*******************/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionTableViewCell
        //assign the business
        cell.collection = self.collections[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if collections != nil{
            return collections.count
        }else{
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onAddButton(sender: AnyObject) {
        //Bring up an action sheet, segue based on what they selected in the action sheet
        self.presentViewController(actionSheet, animated: true) { 
            print("Closed action sheet...")
        }
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        NSNotificationCenter.defaultCenter().postNotificationName("UserDidLogout", object: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "CollectionToDetailSegue"{
            //get the collection id and send it to the destination view controller
            
            let cell = sender as! CollectionTableViewCell
            let collectionDetailViewController = segue.destinationViewController as! CollectionDetailViewController
            collectionDetailViewController.collection = cell.collection
        }
    }
    
}
