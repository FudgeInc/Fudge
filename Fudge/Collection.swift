//
//  Collection.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Parse

class Collection: NSObject {
    var recipes: [Int]?
    var owner: PFUser?
    var collaborators: [PFUser]?
    var collectionId: String?
    var name:String?
    
    init(obj: PFObject) {
        //TODO: see if we can cast it like this
        collectionId = obj.objectId
        recipes = obj["Recipes"] as? [Int]
        owner = obj["Owner"] as? PFUser
        collaborators = obj["Collaborators"] as? [PFUser]
        name = obj["Name"] as? String
    }
    
    
    //method to create collection objects from an array
    class func getCollectionsFromArray(arr: [PFObject])->[Collection]{
        var newArr = [Collection]()
        for item in arr{
            let newCollection = Collection(obj: item)
            newArr.append(newCollection)
        }
        return newArr
    }
    
    //TODO: add methods to make recipe collection from an array
    class func getRecipesForCollection(collection:Collection)->[Recipe]{
        let collectionId = collection.collectionId!
        var recipesForCollection=[Recipe]()//initialize our recipes to an empty array
        //query the backend to get the recipes for our collection
        let query = PFQuery(className: "Recipe")
        query.whereKey("collections", equalTo: collectionId)
        query.findObjectsInBackgroundWithBlock { (results:[PFObject]?, error:NSError?) in
            if error == nil{
                //if there's no error it went through correctly
                if let results = results{
                     recipesForCollection = Recipe.recipesForArray(results)
                     print(recipesForCollection)
                }
            }else{
                NSLog((error?.localizedDescription)!)
            }
        }
        return recipesForCollection
    }
}
