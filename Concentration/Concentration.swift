//
//  Concentration.swift
//  Concentration
//
//  Created by 牧野 壽永 on 2018/03/30.
//  Copyright © 2018年 牧野 壽永. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): You must have more then 0 pairs.")
        var tmpCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            tmpCards += [card, card]
        }
        // TODO: shuffle cards.
        while tmpCards.count > 0 {
            cards.append(tmpCards.remove(at: tmpCards.count.arc4radom))
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
