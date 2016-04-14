//
//  CollectionDetailViewController.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class CollectionDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var collectionId: String!
    var collection: Collection!
    var recipes:[Recipe]? //the recipes we will use
    var hud = MBProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        hud.show(true)
        //iterate over the and make new pfobjects
        var objectArr = [PFObject]()
        for item in collection.recipes!{
            let key = item as String
            var obj = PFObject(withoutDataWithClassName: "recipe", objectId: item)
            objectArr.append(obj)
        }
        
        PFObject.fetchAllInBackground(objectArr) { (result:[AnyObject]?, error:NSError?) in
            //cast it as an array of pfobjects so we can get recipes for it
            let resultObjArr = result as? [PFObject]
            if let resultObjArr = resultObjArr{
                self.recipes = Recipe.recipesForArray(resultObjArr)
                print(self.recipes)
                self.tableView.reloadData()
                self.hud.hide(true)
            }
        }
    }
    
    /*******************/
    /*TableView Methods*/
    /*******************/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CollectionDetailCell", forIndexPath: indexPath) as! CollectionDetailTableViewCell
        //assign the business
        cell.recipe = self.recipes![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if recipes != nil{
            return recipes!.count
        }else{
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /***********************
    * Segue to view Recipe *
    ***********************/
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "recipeDetailSegue"){
            
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPathForCell(cell) {
                let recipeDetailController = segue.destinationViewController as! RecipeViewController
                
                let recipe = recipes![indexPath.row]
                
                recipeDetailController.recipe = recipe
                
                tableView.deselectRowAtIndexPath(indexPath, animated: true)

                
            }
        }
       
    }
    

}
