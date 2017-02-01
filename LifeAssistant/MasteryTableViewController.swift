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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            cell.masteryLabel.text = DataManager.defaults.object(forKey: "\(indexPath.row + 1)") as? String
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddCell" , for: indexPath) as! MasteryTableViewCell
            cell.addMastery.addTarget(self, action: #selector(MasteryTableViewController.addToggled(_:)), for: UIControlEvents.touchUpInside)
            cell.addMasteryNameTextField.addTarget(self, action: #selector(MasteryTableViewController.masteryTextEditEnded(_:)), for: UIControlEvents.editingDidEndOnExit)
            cell.addMasteryNameTextField.addTarget(self, action: #selector(MasteryTableViewController.masteryTextEditEnded(_:)), for: UIControlEvents.editingDidEnd)
            return cell
        }
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
