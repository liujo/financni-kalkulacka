//
//  PlanujeteDetiTableViewController.swift
//  Financni kalkulacka
//
//  Created by Joseph Liu on 06.11.15.
//  Copyright © 2015 Joseph Liu. All rights reserved.
//

import UIKit

class PlanujeteDetiTableViewController: UITableViewController {
    
    var cellLabels = ["Ano", "Ne"]
    var checkedCell = Int()
    var int = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Děti"
        
        if int == 0 {
        
            checkedCell = cellLabels.indexOf(udajeKlienta.planujeteDeti)!
        
        } else if int == 1 {
            
            checkedCell = 0
            
            if udajeKlienta.otazka1 == false {
                
                checkedCell = 1
            
            }
        
        } else {
            
            checkedCell = 0
            
            if udajeKlienta.otazka2 == false {
                
                checkedCell = 1
                
            }
            
        }
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage()
        imageView.image = image.background(UIScreen.mainScreen().bounds.height)
        tableView.backgroundView = imageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = cellLabels[indexPath.row]
        
        if indexPath.row == checkedCell {
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row != checkedCell {
            
            let tappedCell = tableView.cellForRowAtIndexPath(indexPath)
            
            tappedCell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            tableView.cellForRowAtIndexPath(NSIndexPath(forRow: checkedCell, inSection: 0))?.accessoryType = UITableViewCellAccessoryType.None
            
            checkedCell = indexPath.row
        }
        
        if int == 0 {
        
            udajeKlienta.planujeteDeti = cellLabels[checkedCell]
        
        } else if int == 1 {
            
            udajeKlienta.otazka1 = true
            
            if indexPath.row == 1 {
                
                udajeKlienta.otazka1 = false
                
            }
        
        } else {
         
            udajeKlienta.otazka2 = true
            
            if indexPath.row == 1 {
                
                udajeKlienta.otazka2 = false
            }
            
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
}
