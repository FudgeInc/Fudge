//
//  RecipeAddViewController.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD
class RecipeAddViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
    
    @IBOutlet weak var chooseCollectionButton: UIButton!
    
    var collection:Collection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ingredientsTextView.layer.borderWidth = 1
        self.ingredientsTextView.layer.borderColor = UIColor.blackColor().CGColor
        self.stepsTextView.layer.borderWidth = 1
        self.stepsTextView.layer.borderColor = UIColor.blackColor().CGColor
        
        self.stepsTextView.delegate = self
        self.ingredientsTextView.delegate = self
        //if there's a collection from the select collection set it as the button label
        if let collection = collection {
            chooseCollectionButton.setTitle(collection.name, forState: UIControlState.Normal)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        //if there's a collection from the select collection set it as the button label
        collection = Collection.selectedCollection
        if let collection = collection {
            print("changing butotn text")
            chooseCollectionButton.setTitle(collection.name, forState: UIControlState.Normal)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if let collection = collection {
            chooseCollectionButton.setTitle(collection.name, forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCollectionPressed(sender: AnyObject) {
    }
    

    @IBAction func onsubmitPressed(sender: AnyObject) {
        if(titleField.text! != "" && ingredientsTextView.text! != "" && stepsTextView.text! != "" ){
            
            let title = titleField.text
            let ingredients = ingredientsTextView.text
            let steps = stepsTextView.text
            
            let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.Indeterminate
            loadingNotification.labelText = "Uploading to Fudge"
            //TODO: fix this so we have a description field
            
            let recipe = PFObject(className: "recipe")
            
            recipe["name"] = title
            recipe["steps"] = steps
            recipe["Ingredients"] = ingredients
            recipe["Description"] = title
            recipe["Creator"] = PFUser.currentUser()?.username //do it by username
            
            recipe.saveInBackgroundWithBlock({ (completed:Bool, error:NSError?) in
                if(completed){
                    
                    //now update the collection
                    if (self.collection != nil){
                        //get the collection from the server and update it
                        let query = PFQuery(className: "Collection")
                        query.getObjectInBackgroundWithId(self.collection!.collectionId!, block: { (result:PFObject?, error:NSError?) in
                            if let error = error{
                                NSLog(error.localizedDescription)
                            }else{
                                //append the object id of the recipe to the array, then add i
                                var arr = result!["recipes"] as! [String]
                                arr.append(recipe.objectId!)
                                //TODO: there's a better way to do this
                                
                                //save the updated collection
                                
                                result!["recipes"] = arr
                                result?.saveInBackgroundWithBlock({ (completed:Bool, error:NSError?) in
                                    if(completed){
                                        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                                        print("success")
                                        //TODO: perform segue back to collection view
                                        
                                        self.titleField.text = ""
                                        self.ingredientsTextView.text = ""
                                        self.stepsTextView.text = ""
                                        self.performSegueWithIdentifier("AddRecipeSegue", sender: nil)
                                    }else{
                                        if let error = error{
                                            NSLog(error.localizedDescription)
                                        }
                                    }
                                })
                            }
                        })
                    }else{
                        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                        print("success")
                        //TODO: perform segue back to collection view
                        
                        self.titleField.text = ""
                        self.ingredientsTextView.text = ""
                        self.stepsTextView.text = ""
                        self.performSegueWithIdentifier("AddRecipeSegue", sender: nil)
                    }
                    
                }
                else{
                    print(error?.localizedDescription)
                    //TODO: display error message perform segue
                }
            })
            /*

            Recipe.postRecipe(withSteps: steps, withIngredients: ingredients, withDescription: title,name:title, withCompletion: { (completed: Bool, error: NSError?) in
                if(completed){
                    
                     //now update the collection
                    if (self.collection != nil){
                        //get the collection from the server and update it
                        let query = PFQuery(className: "Collection")
                        query.getObjectInBackgroundWithId(self.collection!.collectionId!, block: { (result:PFObject?, error:NSError?) in
                            if let error = error{
                                NSLog(error.localizedDescription)
                            }else{
                                //append the object id of the recipe to the array, then add i
                                var arr = result!["recipes"] as! [Int]
                                arr.append(recipe.objectId)
                            }
                        })
                    }else{
                    MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                    print("success")
                    //TODO: perform segue back to collection view
                    
                    self.titleField.text = ""
                    self.ingredientsTextView.text = ""
                    self.stepsTextView.text = ""
                    self.performSegueWithIdentifier("AddRecipeSegue", sender: nil)
                    }

                }
                else{
                    print(error?.localizedDescription)
                    //TODO: display error message perform segue
                }
            })*/
            
        }
    }
    //this will be to add the recipe to a collection

    
    //check to see if all fields are null, then post data to parse

 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
