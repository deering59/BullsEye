//
//  ViewController.swift
//  BullsEye
//
//  Created by dee on 05/04/16.
//  Copyright © 2016 DeEring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue: Int = 0
  var targetValue: Int = 0
  var score = 0
  var round = 0
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewGame()
    updateLabels()
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert(){
    let difference = abs(currentValue-targetValue)
    var points = 100 - difference
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    }
    else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    }
    else if difference < 10 {
      title = "Pretty good!"
    }
    else {
      title = "Not even close..."
    }
    
    score += points
    
    let alertMessage = "You have scored: (\(points))"
    
    let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default,
      handler: { action in
        self.startNewRound()
        self.updateLabels()
    })
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(slider: UISlider){
    print(Int(slider.value))
    currentValue = Int(slider.value)
  }
  
  func startNewRound(){
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
  }
  
  @IBAction func startOver() {
    startNewGame()
    updateLabels()
  }
  
}

