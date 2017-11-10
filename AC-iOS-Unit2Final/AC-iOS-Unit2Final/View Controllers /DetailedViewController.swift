//
//  DetailedViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Ashlee Krammer on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    var thisCrayon: Crayon!
    //    var currentRedValue = 0.0
    //    var currentBlueValue = 0.0
    //    var currentGreenValue = 0.0
    
    
//Stepper Current Value
    var stepperCurrentValue: CGFloat = 1  {
        didSet {
            
            self.viewController.backgroundColor? = UIColor.white.withAlphaComponent(stepperCurrentValue)
            currentAlphaStepper.value = Double(CGFloat(stepperCurrentValue))
            currentAlphaValueLabel.text = "Current Alpha Value: \(stepperCurrentValue)"
            
            
        }
    }
    
    
//Slider Current Value
    
    var sliderCurrentValue: CGFloat = 0 {
        didSet {
            
            redHueSlider.value = Float(CGFloat(thisCrayon.red / 255))
            greenHueSlider.value = Float(CGFloat(thisCrayon.green / 255))
            blueHueSlider.value = Float(CGFloat(thisCrayon.blue / 255))
            redSliderValueLabel.text = "Red Value: \(redHueSlider.value)"
            blueSliderValueLabel.text = "Blue Value: \(blueHueSlider.value)"
            greenSliderValueLabel.text = "Green Value: \(greenHueSlider.value)"
        }
        
    }
    
    
    //Outlets
    @IBOutlet var viewController: UIView!
    //Labels
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    @IBOutlet weak var currentAlphaValueLabel: UILabel!
    
    //Controls
    @IBOutlet weak var redHueSlider: UISlider!
    @IBOutlet weak var greenHueSlider: UISlider!
    @IBOutlet weak var blueHueSlider: UISlider!
    @IBOutlet weak var currentAlphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    
    //View Did Load
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        colorNameLabel.text = thisCrayon.name
    ////        self.currentRedValue = thisCrayon.red
    ////        self.currentBlueValue = thisCrayon.blue
    ////        self.currentGreenValue = thisCrayon.green
    //
    //        resetButton.isHidden = true
    //        resetButton.isEnabled = false
    //        stepperCurrentValue = 1
    //        sliderCurrentValue = 0
    //        changeAllBackgroundColors()
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = thisCrayon.name
        resetButton.isHidden = true
        resetButton.isEnabled = false
        stepperCurrentValue = 1
        sliderCurrentValue = 0
        changeAllBackgroundColors()
        hideResetButton()
    }
    
    
    //Slider Value Changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //self.sliderCurrentValue = CGFloat(sender.value)
        
        
        redSliderValueLabel.text = "Red Value: \(redHueSlider.value)"
        blueSliderValueLabel.text = "Blue Value: \(blueHueSlider.value)"
        greenSliderValueLabel.text = "Green Value: \(greenHueSlider.value)"
        showResetButton()
        
    }
    
    
    
    
//Stepper Value Changed
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentAlphaValueLabel.text = "Current Alpha Value: \(stepperCurrentValue)"
        self.stepperCurrentValue = CGFloat(sender.value)
        showResetButton()
    }
   
    
//Changes background colors
    func changeAllBackgroundColors(){
        let thisColor = UIColor(displayP3Red: CGFloat(thisCrayon.red / 255), green: CGFloat(thisCrayon.green / 255), blue: CGFloat(thisCrayon.blue / 255), alpha: 1.0)
        
        redSliderValueLabel.backgroundColor = thisColor
        greenSliderValueLabel.backgroundColor = thisColor
        blueSliderValueLabel.backgroundColor = thisColor
        viewController.backgroundColor = thisColor
        blueHueSlider.backgroundColor = thisColor
        greenHueSlider.backgroundColor = thisColor
        redHueSlider.backgroundColor = thisColor
        currentAlphaValueLabel.backgroundColor = thisColor
        
        if thisCrayon.red == 0 && thisCrayon.blue == 0 && thisCrayon.green == 0 {
            redSliderValueLabel.textColor = UIColor.white
            greenSliderValueLabel.textColor = UIColor.white
            blueSliderValueLabel.textColor = UIColor.white
            currentAlphaValueLabel.textColor = UIColor.white
        }
    }
    
    
//    Shows Reset Button
    func showResetButton() {
        resetButton.isHidden = false
        resetButton.isEnabled = true
    }
    
    
//    Hides Reset Button
    func hideResetButton() {
        resetButton.isHidden = true
        resetButton.isEnabled = false
    }
    
    
}
