//
//  ViewController.swift
//  Cassini
//
//  Created by Leo.Tian on 21/4/2016.
//  Copyright © 2016 Leo.Tian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let ivc = segue.destinationViewController as? ImageViewController{
            
            if let identifier = segue.identifier {
                
                switch identifier {
                    
                    case "Earth":
                        ivc.imageURL = DemoURL.NASA.Earth
                        ivc.title = "Earth"
                    case "Cassini":
                        ivc.imageURL = DemoURL.NASA.Cassini
                        ivc.title = "Cassini"
                    case "Saturn":
                        ivc.imageURL = DemoURL.NASA.Saturn
                        ivc.title = "Saturn"
                default: break
                    
                }
                
            }
            
        }
    }

}

