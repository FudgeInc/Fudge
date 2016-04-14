//
//  RecipeViewController.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    
    //both text views are not editable
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
  
    var recipe:Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(recipe.steps)
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
