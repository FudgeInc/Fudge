//
//  RecipeAddViewController.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse
class RecipeAddViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
    
    var collectionName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            
            Recipe.postRecipe(withSteps: steps, withIngredients: ingredients, withDescription: title, withCompletion: { (completed: Bool, error: NSError?) in
                if(completed){
                    print("success")
                    //TODO: perform segue back to collection view
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
