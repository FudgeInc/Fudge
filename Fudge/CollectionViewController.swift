//
//  CollectionViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "CollectionToDetailSegue"{
            //get the collection id and send it to the destination view controller
            
            let cell = sender as! CollectionTableViewCell
            let collectionDetailViewController = segue.destinationViewController as! CollectionDetailViewController
            CollectionDetailViewController.collection = cell.collectionId
        }
    }
    

}
