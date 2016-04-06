//
//  AddCollectionViewController.swift
//  Fudge
//
//  Created by Matt on 3/29/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse

class AddCollectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onAddCollectionPress(sender: AnyObject) {
        //create a new collection object
        var collection = PFObject(className: "Collection")
        
        //add a blank recipe array 
        collection["recipes"] = []
        
        let userString = (PFUser.currentUser()?.username)! as String
        collection["owner"] = userString
        collection["collaborators"] = [userString]
        
        collection["name"] = collectionNameTextField.text! as String
        
        collection.saveInBackgroundWithBlock { (success: Bool, error:NSError?) in
            if(success){
                NSLog("succesfully pushed collection!")
                //do the back segue
                self.navigationController?.popViewControllerAnimated(true)
            }else{
                NSLog((error?.localizedDescription)!)
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
