//
//  ViewController.swift
//  craps-201806110940
//
//  Created by Adland Lee on 6/11/18.
//  Copyright © 2018 Adland Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    var dieCollection = [Die]()
    
    
    // MARK: - IBOutlets

    @IBOutlet weak var die0Label: UILabel!
    @IBOutlet weak var die1Label: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    // MARK: - IBactions

    @IBAction func rollDice(_ sender: Any) {
        for die in dieCollection {
            _ = die.roll()
        }
        updateUI()
    }

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dieCollection.append(Die(6, initialFace: 3))
        dieCollection.append(Die(6, initialFace: 4))
        
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- Helper Functions
    
    func dieTotal() -> Int {
        return dieCollection.reduce(0) { (result, die) -> Int in
            result + die.face
            }
    }
    
    func updateDice() {
        die0Label.text = String(dieCollection[0].face)
        die1Label.text = String(dieCollection[1].face)
    }
    
    func updateTotal() {
        totalLabel.text = String(dieTotal())
    }
    
    func updateUI() {
        updateDice()
        updateTotal()
    }
}

