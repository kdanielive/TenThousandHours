//
//  MasteryTableViewController.swift
//  LifeAssistant
//
//  Created by Daniel Kim on 1/31/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit

class MasteryTableViewController: UITableViewController {
    
    
    var masteryNum = 0
    
    var startedTime = NSDate()
    var lastStartedTime = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        
        masteryNum = DataManager.defaults.integer(forKey: "masteryNum")
        
        self.tableView.allowsSelection = false
        
        self.view.isUserInteractionEnabled = true
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masteryNum + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row < masteryNum) {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "MasteryCell" , for: indexPath) as! MasteryTableViewCell
            cell.masteryLabel.text = (DataManager.defaults.object(forKey: "\(indexPath.row + 1)") as! String)
            
            cell.deleteMastery.tag = indexPath.row
            cell.deleteMastery.addTarget(self, action: #selector(MasteryTableViewController.deleteToggled(_:)), for: UIControlEvents.touchUpInside)
            
            cell.startTime.addTarget(self, action: #selector(MasteryTableViewController.startTimer(_:)), for: UIControlEvents.touchUpInside)
            cell.startTime.tag = indexPath.row
            print(cell.startTime.tag)
            
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddCell" , for: indexPath) as! MasteryTableViewCell
            cell.addMastery.addTarget(self, action: #selector(MasteryTableViewController.addToggled(_:)), for: UIControlEvents.touchUpInside)
            cell.addMasteryNameTextField.addTarget(self, action: #selector(MasteryTableViewController.masteryTextEditEnded(_:)), for: UIControlEvents.editingDidEndOnExit)
            cell.addMasteryNameTextField.addTarget(self, action: #selector(MasteryTableViewController.masteryTextEditEnded(_:)), for: UIControlEvents.editingDidEnd)
            
            DataManager.setMasteryNum(number: masteryNum)
            
            return cell
        }
    }
    
    func startTimer(_ sender: UIButton) {
        lastStartedTime = startedTime
        startedTime = NSDate()
        
        let currentTag = sender.tag
        
        let elapsedTime : Double = startedTime.timeIntervalSince(lastStartedTime as Date)
        
        if(DataManager.defaults.integer(forKey: "lastTag") != 0) {
            let lastTag = DataManager.defaults.integer(forKey: "lastTag")
            print(DataManager.defaults.integer(forKey: "lastTag"))
            let saveTargetString = DataManager.defaults.object(forKey: "\(lastTag)") as! String
            print(DataManager.defaults.object(forKey: "\(lastTag)") as! String)
            let previousElapsed = DataManager.defaults.double(forKey: saveTargetString)
            print(DataManager.defaults.double(forKey: saveTargetString))
            DataManager.defaults.set(previousElapsed + elapsedTime, forKey: saveTargetString)
            DataManager.defaults.set(currentTag + 1, forKey: "lastTag")
        } else {
            DataManager.defaults.set(currentTag + 1, forKey: "lastTag")
        }
        
        print(elapsedTime)
    }
    
    func deleteToggled(_ sender: UIButton) {
        for i in sender.tag...(masteryNum - 1) {
            DataManager.defaults.set(DataManager.defaults.object(forKey: "\(i + 2)") as? String, forKey: "\(i + 1)")
        }
        
        masteryNum -= 1
        DataManager.setMasteryNum(number: masteryNum)
        
        self.tableView.reloadData()
    }

    func masteryTextEditEnded(_ sender: UITextField) {
        DataManager.tempMasteryName = sender.text!
    }
    
    func addToggled(_ sender: UIButton) {
        
        let keyForDefaults = masteryNum + 1
        
        DataManager.defaults.set(DataManager.tempMasteryName, forKey: "\(keyForDefaults)")
        
        masteryNum += 1
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
