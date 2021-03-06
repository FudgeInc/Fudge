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
    var name: String?
    var picUrl: NSURL?
    var desc: String?
    var steps: String? //the steps you need to take to make the recipe
    var ingredients: String?
    var creator: String? //the user that made the recipe
    var collections:[Int]? //the Id's of the collections the user is in
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
        name = obj["name"] as? String
        
        desc = obj["Description"] as? String
        //TODO: Make sure we can cast the array like this
        steps = obj["steps"] as? String
        ingredients = obj["Ingredients"] as? String
        creator = obj["Creator"] as? String
        collections = obj["Collections"] as? [Int]
        
        //check for the external url, if it doesn't exist make it an empty string
        let urlString = obj["Url"] as? String
        if let urlString = urlString{
            url = NSURL(string: urlString)
        }else{
            url = NSURL(string: "")
        }
    }
    
    class func postRecipe(withSteps steps: String!, withIngredients ingredients: String!, withDescription title: String!,name: String!, withCompletion completion: PFBooleanResultBlock){
        let recipe = PFObject(className: "recipe")
        
        recipe["name"] = name
        recipe["steps"] = steps
        recipe["Ingredients"] = ingredients
        recipe["Description"] = title
        recipe["Creator"] = PFUser.currentUser()?.username //do it by username
        
        //Figure out how to generate a recipe ID maybe a global total of recipes submitted
        
        recipe.saveInBackgroundWithBlock(completion)

    }
    
    
    //creates recipes from the array and returns them
    class func recipesForArray(arr: [PFObject])->[Recipe]{
        var newArr = [Recipe]()
        for item in arr{
            let newRecipe = Recipe(obj: item)
            newArr.append(newRecipe)
        }
        return newArr
    }
}
