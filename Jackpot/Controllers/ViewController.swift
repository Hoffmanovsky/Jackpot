//
//  ViewController.swift
//  Jackpot
//
//  Created by Admin on 31.06.2018.
//  Copyright © 2018 Daniel Kaminski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slotImage2: UIImageView!
    @IBOutlet weak var slotImage3: UIImageView!
    @IBOutlet weak var slotImage1: UIImageView!
    @IBOutlet weak var slotButton: UIButton!
    @IBOutlet weak var machineslotblank: UIImageView!
    
    let slots = [1 : Slot.Raspberries, 2 : Slot.Cherries, 3 : Slot.Bananas, 4 : Slot.Jackpot]
    
    override func viewDidLoad() {
        slotButton.layer.cornerRadius = 10
        super.viewDidLoad()
    }
    
    @IBAction func roll(_ sender: Any) {
        let slotRolled1 = Int(arc4random_uniform(UInt32(slots.count))+1)
        let slotRolled2 = Int(arc4random_uniform(UInt32(slots.count))+1)
        let slotRolled3 = Int(arc4random_uniform(UInt32(slots.count))+1)
        guard let slot1 = slots[slotRolled1], let slot2 = slots[slotRolled2], let slot3 = slots[slotRolled3] else { return }
        slotImage1.image = UIImage(named: slot1.rawValue)
        slotImage2.image = UIImage(named: slot2.rawValue)
        slotImage3.image = UIImage(named: slot3.rawValue)
        checkSlots(firstSlot: slot1, secondSlot: slot2, thirdSlot: slot3)
    }
    
    func checkSlots(firstSlot: Slot, secondSlot: Slot, thirdSlot: Slot) {
        if firstSlot == secondSlot && firstSlot == thirdSlot {
            resultLabel.text = getResultText(slot: firstSlot)
        } else {
            resultLabel.text = "Try again"
        }
    }
    
    func getResultText(slot: Slot) -> String {
        switch slot {
        case .Raspberries:
            return "3 Raspberries! 100 points!"
        case .Cherries:
            return "3 Cherries! 200 points!"
        case .Bananas:
            return "3 Bananas! 300 points!"
        case .Jackpot:
            return "JACKPOT!!! CONGRATULATIONS!!!"
        }
    }
}
