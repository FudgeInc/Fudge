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
class RecipeAddViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
    
    var collectionName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ingredientsTextView.layer.borderWidth = 1
        self.ingredientsTextView.layer.borderColor = UIColor.blackColor().CGColor
        self.stepsTextView.layer.borderWidth = 1
        self.stepsTextView.layer.borderColor = UIColor.blackColor().CGColor
        
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
            
            Recipe.postRecipe(withSteps: steps, withIngredients: ingredients, withDescription: title, withCompletion: { (completed: Bool, error: NSError?) in
                if(completed){
                    MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                    print("success")
                    //TODO: perform segue back to collection view
                    
                    self.titleField.text = ""
                    self.ingredientsTextView.text = ""
                    self.stepsTextView.text = ""
                    self.performSegueWithIdentifier("AddRecipeSegue", sender: nil)

                }
                else{
                    print(error?.localizedDescription)
                    //TODO: display error message perform segue
                }
            })
            
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
