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
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  var targetValue: Int = 0

  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
    updateLabels()
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert(){
    let difference: Int = abs(currentValue-targetValue)
    let alertMessage = "The value of the slider is: \(currentValue)" + "\nThe difference is: \(targetValue)" + "\nYou have scored: (\(difference))"
    
    let alert = UIAlertController(title: "Hello world", message: alertMessage, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    startNewRound()
    updateLabels()
  }
  
  @IBAction func sliderMoved(slider: UISlider){
  }
  
  func startNewRound(){
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
  }
  

}

