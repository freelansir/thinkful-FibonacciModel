//
//  ViewController.swift
//  thinkful-FibonacciModel
//
//  Created by David Kong on 2014-10-07.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // Graphic elements
    var selectedValueLabel: UILabel?
    var outputTextView: UITextView?
    var theSlider: UISlider?
    
    
    
    // An instance of the model
    var fibo : FibonacciModel = FibonacciModel()    // var fibo = FibonacciModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addASlider()

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func addASlider(){
        
        // Create the Slider
        self.theSlider = UISlider(frame: CGRectMake(60, 244, 200, 20))      // var theSlider = UISlider(frame: CGRectMake(60, 244, 200, 20))
        self.view.addSubview(theSlider!)
        
        // Assign minimum and maximum values
        self.theSlider!.minimumValue = 2
        self.theSlider!.maximumValue = 50
        self.theSlider!.value = 10
        
        // Create labels to display the min/max values on the slider UI
        var minLabel = UILabel(frame: CGRectMake(70, 205, 40, 40))
        minLabel.text = String (Int(theSlider!.minimumValue))
        self.view.addSubview(minLabel)
        
        var maxLabel = UILabel(frame: CGRectMake(235, 205, 40, 40))
        maxLabel.text = String (Int(theSlider!.maximumValue))
        self.view.addSubview(maxLabel)
        
        // Create labels to display selected value
        self.selectedValueLabel = UILabel(frame: CGRectMake(160, 320, 40, 40))
        self.selectedValueLabel!.text = String(Int(theSlider!.value))       //set to minimum value
        self.view.addSubview(selectedValueLabel!)
        
        // Create label to hold output of slider values
        self.outputTextView = UITextView(frame: CGRectMake(20, 350, 300, 140))
        self.view.addSubview(self.outputTextView!)
        
        // selectedValueLabel!.removeFromSuperview()
        
        // Update the value label when slider value is updated... Ie. Stores value into label declared above...
        self.theSlider!.addTarget(self, action: "sliderValueDidChange", forControlEvents: UIControlEvents.ValueChanged)

    }
    
    
    func sliderValueDidChange() {
        
        var returnedArray: [Int] = []
        var formattedOutput: String = ""
        
        // Display the updated slider value
        self.selectedValueLabel!.text = String(Int(theSlider!.value))
        
        // Calculate the Fibonacci sequence based on slider input values
        returnedArray = self.fibo.calculateFibonacciNumbers(minimum2: Int(theSlider!.value))
        
        // Put the elements in a nicely formatted array
        for number in returnedArray {
            
            formattedOutput = formattedOutput + String(number) + ", "
    
        }
        
        // Update the textField with the formatted array
        self.outputTextView!.text = formattedOutput
        
    }
    
    


}

