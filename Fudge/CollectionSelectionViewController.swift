//
//  CollectionSelectionViewController.swift
//  Fudge
//
//  Created by Matt on 4/12/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class CollectionSelectionViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //pass this in from the main view
    var collections: [Collection]! //the users collections to display in the table

    override func viewDidLoad() {
        super.viewDidLoad()
        //set the delegate and datasource for tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension //set thiis so autolayout will decide the height
        tableView.estimatedRowHeight = 200
        
        //get the array of collections
        collections = Collection.collections
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*******************/
    /*TableView Methods*/
    /*******************/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CollectionSelectionCell", forIndexPath: indexPath) as! CollectionTableViewCell
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
