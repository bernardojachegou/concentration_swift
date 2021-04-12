//
//  ViewController.swift
//  PlayingCard
//
//  Created by Michel Bernardo on 23/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  var deck = PlayingCardDeck()
  
  @IBOutlet weak var PlayingCardView: PlayingCardView! {
    didSet {
      let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
      swipe.direction = [.left, .right]
      PlayingCardView.addGestureRecognizer(swipe)
      let pinch = UIPinchGestureRecognizer(target: PlayingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
      PlayingCardView.addGestureRecognizer(pinch)
    }
  }
  
  @IBAction func flipCard(_ sender: UIGestureRecognizer) {
    switch sender.state {
    case .ended:
      PlayingCardView.isFaceUp = !PlayingCardView.isFaceUp
    default:
      break
    }
    
  }
  
  @objc func nextCard() {
    if let card = deck.draw() {
      PlayingCardView.rank = card.rank.order
      PlayingCardView.suit = card.suit.rawValue
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for _ in 1...10 {
      if let card = deck.draw() {
        print("\(card)")
      }
    }
  }
}

