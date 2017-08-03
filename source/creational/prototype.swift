//: Prototype Pattern

import Foundation
import UIKit

class Card {
    var name: String?
    var mana: Int?
    var attack: Int?
    var defense: Int?
    
    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        self.name = name
        self.mana = mana
        self.attack = attack
        self.defense = defense
    }
    
    func clone() -> Card {
        return Card(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
}

