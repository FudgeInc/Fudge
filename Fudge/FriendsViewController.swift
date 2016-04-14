//
//  FriendsViewController.swift
//  Fudge
//
//  Created by Devon Maguire on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let friends = friends {
            return friends.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        
        let friend = friends![indexPath.row]
        /*
         let title = movie["title"] as! String
         let overview = movie["overview"] as! String
         cell.titleLabel.text = title
         cell.overviewLabel.text = overview
         
         let baseUrl = "http://image.tmdb.org/t/p/w500"
         if let posterPath = movie["poster_path"] as? String {
         let imageUrl = NSURL(string: baseUrl + posterPath)
         cell.posterView.setImageWithURL(imageUrl!)
         }
         
         let backgroundView = UIView()
         backgroundView.backgroundColor = UIColor.grayColor()
         cell.selectedBackgroundView = backgroundView
         */
        return cell
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
