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
  var targetValue: Int = 0

  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentValue = lroundf(slider.value)
    targetValue = 1 + Int(arc4random_uniform(100))
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert(){
    let alertMessage = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
    
    let alert = UIAlertController(title: "Hello world", message: alertMessage, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(slider: UISlider){
    
  }
}

