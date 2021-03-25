//
//  Card.swift
//  Concentration
//
//  Created by Michel Bernardo on 18/03/21.
//

import Foundation

struct Card: Hashable {
  static func == (lhs: Card, rhs: Card) -> Bool {
          lhs.identifier == rhs.identifier
      }
  
  var isFaceUp =  false
  var isMatched = false
  private var identifier: Int
  
  private static var identifierFactory = 0
  
  private static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
  }
  
  init() {
    self.identifier = Card.getUniqueIdentifier()
  }
}
