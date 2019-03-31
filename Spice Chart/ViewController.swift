//
//  ViewController.swift
//  Spice Chart
//
//  Created by Scott Damopoulos on 3/31/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   /*
   let layer =  CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.yellow.cgColor,UIColor.green.ccgColor]
        layer.startPoint = CGPoint (0,0)
        layer.endPoint = CGPoint (1,1)
        view.layer.addSubLayer (layer)
        
        
        
        
        import UIKit
        
        class ViewController: UIViewController {
            enum VolumeUnit: String { case tablespoons, cups }
            enum WeightUnit: String { case kilos, pounds }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                self.volumeUnit = .tablespoons
                self.volumeValue = 0
                // Do any additional setup after loading the view, typically from a nib.
                
                
            }
            
            var volumeUnit = VolumeUnit.tablespoons { didSet {
                self.volumeStepper.stepValue = 0.01
                
                switch self.volumeUnit {
                case .tablespoons:
                    self.volumeSlider.minimumValue = 0
                    self.volumeSlider.maximumValue = 80
                    self.volumeStepper.minimumValue = 0
                    self.volumeStepper.maximumValue = 80
                    self.volumeUnitsPicker.selectRow(0, inComponent: 0, animated: true)
                    
                case .cups:
                    self.volumeSlider.minimumValue = 0
                    self.volumeSlider.maximumValue = 10
                    self.volumeStepper.minimumValue = 0
                    self.volumeStepper.maximumValue = 10
                    self.volumeUnitsPicker.selectRow(1, inComponent: 0, animated: true)
                }
                }}
            var volumeValue: Double = 0 { didSet {
                self.volumeSlider.value = Float(self.volumeValue)
                self.volumeStepper.value = self.volumeValue
                
                self.volumeLabel.text = String(format: "%.2f ", self.volumeValue, self.volumeUnit.rawValue)
                }}
            
            @IBOutlet weak var volumeStepper: UIStepper!
            @IBOutlet weak var volumeUnitsPicker: UIPickerView!
            @IBOutlet weak var volumeLabel: UILabel!
            @IBOutlet weak var volumeSlider: UISlider!
            @IBAction func volumeSliderChanged(_ sender: Any) {
                self.volumeValue = Double(Int(self.volumeSlider.value))
            }
            @IBAction func volumeStepperChanged(_ sender: Any) {
                self.volumeValue =  self.volumeStepper.value
            }
        }
        
        
        
        extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
            func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
            
            func pickerView(_ pickrView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                switch pickrView {
                case self.volumeUnitsPicker:
                    return 2
                    
                default: return 0
                }
                
            }
            
            public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                switch pickerView {
                case self.volumeUnitsPicker:
                    return [VolumeUnit.cups, VolumeUnit.cups][row].rawValue
                    
                    
                default: return ""
                }
            }
            
            public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                switch pickerView {
                case self.volumeUnitsPicker:
                    self.volumeUnit = [VolumeUnit.cups, VolumeUnit.tablespoons][row]
                    
                    
                    
                default: return
    
    }

*/
}

