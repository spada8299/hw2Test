//
//  TableViewController.swift
//  hw2Test
//
//  Created by Spada Kao on 2016/4/28.
//  Copyright © 2016年 Spada Kao. All rights reserved.
//

import UIKit
import ObjectMapper

class TableViewController: UITableViewController {
    
    var MRTstations: [Station]!
    var lines: [Line]!
    var lineDict: [String: [Station]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MRT", ofType: "json")!
        let jsonContent = try! String(contentsOfFile: path)
        //print(jsonContent)
        
        self.MRTstations = Mapper<Station>().mapArray(jsonContent)!
        //print(self.MRTstations[0].lines)
        
        for station in MRTstations {
            for lineName in station.lines.keys {
                if (self.lineDict[lineName] == nil) {
                    self.lineDict[lineName] = []
                }
                self.lineDict[lineName]!.append(station)
            }
        }
        
        //print(self.lineDict["板南線"])
        
        self.lines = []
        
        for (lineName, stations) in lineDict {
            self.lines.append(Line(name: lineName, stations: stations))
        }
        
        for index in 0...(lines.count-1) {
            let lineName =  lines[index].name
            lines[index].stations = lines[index].stations.sort { (stationA: Station, stationB: Station) -> Bool in
                return stationA.lines[lineName] < stationB.lines[lineName]
            }
        }
        
        print(self.lines[3])

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.lines.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.lines[section].name
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.lines[section].stations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MyTableViewCell
        
        //let line = self.lines[indexPath.section]
        let station = self.lines[indexPath.section].stations[indexPath.row]
        
        let keys = [String](station.lines.keys)
        print(keys)
        
        // stationNameLabel
        cell.stationNameLabel.text = station.name
        
        // lineNumLabel
        if (keys.count == 2) {
            cell.lineNumLabel.text = station.lines[keys[1]]
            cell.lineNumLabel.backgroundColor = pickLineColor(keys[1])
            cell.lineNumLabel2.text = station.lines[keys[0]]
            cell.lineNumLabel2.backgroundColor = pickLineColor(keys[0])
            cell.lineNumLabel2.alpha = 1.0
        } else {
            cell.lineNumLabel.text = station.lines[keys[0]]
            cell.lineNumLabel.backgroundColor = pickLineColor(keys[0])
            cell.lineNumLabel2.alpha = 0.0
        }
        //cell.lineNumLabel.text = station.lines[line.name]
        //cell.lineNumLabel.backgroundColor = UIColor(red: 203.0/255.0, green: 44.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        //cell.lineNumLabel2.alpha = 0.00

        // Configure the cell...

        return cell
    }
    
    func pickLineColor (lineName: String) -> UIColor {
        switch lineName {
        case "文湖線":
            return UIColor(red: 158.0/255.0, green: 101.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        case "淡水信義線":
            return UIColor(red: 203.0/255.0, green: 44.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        case "新北投支線":
            return UIColor(red: 248.0/255.0, green: 144.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        case "松山新店線":
            return UIColor(red: 0.0/255.0, green: 119.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        case "小碧潭支線":
            return UIColor(red: 206.0/255.0, green: 220.0/255.0, blue: 0.0, alpha: 1.0)
        case "中和新蘆線":
            return UIColor(red: 255.0/255.0, green: 163.0/255.0, blue: 0.0, alpha: 1.0)
        case "板南線":
            return UIColor(red: 0.0, green: 94.0/255.0, blue: 184.0/255.0, alpha: 1.0)
        case "貓空纜車":
            return UIColor(red: 119.0/255.0, green: 185.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        default:
            return UIColor.blackColor()
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)!
            let station = self.lines[indexPath.section].stations[indexPath.row]
            
            let detailViewController = segue.destinationViewController as! ViewController
            detailViewController.station = station
            print(station)
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
