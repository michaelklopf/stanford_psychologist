//
//  ViewController.swift
//  Psychologist
//
//  Created by Michael on 17.07.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let hvc = segue.destinationViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    hvc.happiness = 0
                case "meh":
                    hvc.happiness = 50
                default:
                    hvc.happiness = 100
                }
            }
        }
    }


}

