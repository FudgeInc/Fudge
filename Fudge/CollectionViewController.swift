//
//  CollectionViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    //TODO: Implement tableview

    @IBOutlet weak var tableView: UITableView!
    var actionSheet: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
