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
    var recipes: [String]? //use the object id's of the recipes      
    var owner: String?
    var collaborators: [String]?
    var collectionId: String?
    var name:String?
    static var collections: [Collection]?
    static var selectedCollection: Collection?
    
    init(obj: PFObject) {
        //TODO: see if we can cast it like this
        collectionId = obj.objectId
        owner = obj["owner"] as? String
        collaborators = obj["collaborators"] as? [String]
        name = obj["name"] as? String
        recipes = obj["recipes"] as? [String]
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
    
    //return our collection object persisted 
    class func getCollectionsforUser()-> [Collection]?{
        return collections
    }
    
    class func getSelectedCollection() -> Collection?{
        return selectedCollection
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
