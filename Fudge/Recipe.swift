//
//  Recipe.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse

class Recipe: NSObject {

    var recipeId: Int?
    var picUrl: NSURL?
    var description: String?
    var steps: [String]? //the steps you need to take to make the recipe
    var ingredients: [String]?
    var creator: PFUser? //the user that made the recipe
    var url: NSURL? //the url for an externally hosted recipe
    
    //initalize the model from the pfobject
    init(obj: PFObject) {
        recipeId = obj["RecipeID"] as? Int
        //check to see if the picture url exists as a valid string
        let picString = obj["Picture"] as? String
        if let picString = picString {
             picUrl = NSURL(string: picString)
        }else{
            //otherwise make a blank url
            picUrl = NSURL()
        }
        
        description = obj["Description"] as? String
        //TODO: Make sure we can cast the array like this
        steps = obj["Steps"] as? [String]
        ingredients = obj["Ingredients"] as? [String]
        creator = obj["Creator"] as? PFUser
        
        //check for the external url, if it doesn't exist make it an empty string
        let urlString = obj["Url"] as? String
        if let urlString = urlString{
            url = NSURL(string: urlString)
        }else{
            url = NSURL(string: "")
        }
    }
    
    //TODO: add method to make recips from an array, and post recipe to the server
}
