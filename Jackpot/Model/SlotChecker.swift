//
//  SlotChecker.swift
//  Jackpot
//
//  Created by Admin on 31.07.2018.
//  Copyright © 2018 Daniel Kaminski. All rights reserved.
//

import UIKit

class SlotChecker {

    func checkSlot(_ slot: [Int]) -> Slot {
        var seenOnce: Set<Int> = []
        var seenMorethanOnce: Set<Int> = []
        
        for number in slot {
            if seenMorethanOnce.contains(number) {}
            else if seenOnce.contains(number) {
                seenOnce.remove(number)
                seenMorethanOnce.insert(number)
            } else {
                seenOnce.insert(number)
            }
        }
        if seenOnce.count == 1 {
            return Slot.Bust
        } else if seenOnce.count == 3 {
            return Slot.Bust
        } else if seenOnce.isEmpty && seenMorethanOnce.count == 1 {
            
        }
    }
}
