//
//  ViewController.swift
//  hw2Test
//
//  Created by Spada Kao on 2016/4/28.
//  Copyright © 2016年 Spada Kao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineNameLabel1: UILabel!
    @IBOutlet weak var lineNameLabel2: UILabel!
    
    var station: Station? {
        willSet(newStation) {
            
        }
        didSet(newStation) {
            if self.isViewLoaded() {
                self.fillData()
            }
        }
    }
    func fillData() {
        guard let station = self.station else {
            return
        }
        self.stationNameLabel.text = station.name
        self.title = station.name
        
        let keys = [String](station.lines.keys)
        
        if (keys.count == 2) {
            self.lineNameLabel1.text = keys[0]
            self.lineNameLabel1.backgroundColor = pickLineColor(keys[0])
            self.lineNameLabel2.text = keys[1]
            self.lineNameLabel2.backgroundColor = pickLineColor(keys[1])
            self.lineNameLabel2.hidden = false
        } else {
            self.lineNameLabel1.text = keys[0]
            self.lineNameLabel1.backgroundColor = pickLineColor(keys[0])
            self.lineNameLabel2.hidden = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


}

