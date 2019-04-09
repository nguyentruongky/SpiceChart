//
//  ElementEditor.swift
//  Spice Chart
//
//  Created by Scott Damopoulos on 3/31/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class EditorView: View {
    @IBOutlet weak var unitButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    let pickerWrapper = PickerWrapper()
    weak var detailView: DetailView?

    var delegate: EditorDelegate?

    var valueMin: Double = 0
    var valueMax: Double = 0
    var step: Double = 0
    var datasource = [String]()

    var value: Double = 0 {
        didSet {
            if stepper.value == value {
                let floatValue = Float(value)
                slider.value = floatValue
                valueLabel.text = floatValue.formatNumber()
            } else {
                stepper.value = value
            }

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "valueChange"), object: nil)
        }
    }

    func setDefaultValue() {
        guard let delegate = delegate else { return }
        valueMin = delegate.getMin()
        valueMax = delegate.getMax()
        step = delegate.getStep()
        setStepper()
        setSlider()
    }

    func setDatasource(datasource: [String]) {
        self.datasource = datasource
        pickerWrapper.datasource = datasource
        setSelectedItem(at: 0)
    }

    func setTitle(name: String, type: ElementType) {
        nameLabel.text = name
        unitButton.isHidden = type != .selection
    }

    override func setupView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]

        addSubview(view)

        stepper.addTarget(self, action: #selector(changeStepperValue), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderChange), for: .valueChanged)
        unitButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        pickerWrapper.owner = self
    }

    func setSelectedItem(at index: Int) {
        guard let delegate = delegate else { return }
        guard datasource.count > index else { return }
        let selectedValue = datasource[index]
        unitButton.setTitle(selectedValue, for: .normal)

        delegate.didSelectItem(item: selectedValue, atIndex: index)
        valueMin = delegate.getMin()
        valueMax = delegate.getMax()
        step = delegate.getStep()
        setStepper()
        setSlider()

        convertValue()
    }

    func convertValue() {
        guard let delegate = delegate else { return }
        let index = pickerWrapper.pickerView.selectedRow(inComponent: 0)
        let item = datasource[index]

        value = delegate.convertValue(value: value, selectedItem: item)

        
        valueLabel.text = "\(value.formatNumber())"
        slider.value = Float(value)
        stepper.value = value
    }
}

// MARK: Picker
extension EditorView {
    @objc func showPicker() {
        guard let view = UIApplication.topViewController()?.view else { return }
        view.addSubview(pickerWrapper)
        pickerWrapper.horizontal(toView: view)
        pickerWrapper.bottom(toView: view)
    }
}


// MARK: Slider
extension EditorView {
    @objc func sliderChange(sender: UISlider) {
        let step = Float(self.step)
        var roundedValue = round(sender.value / step) * step
        roundedValue = round(1000 * roundedValue) / 1000
        valueLabel.text = roundedValue.formatNumber()
        value = Double(roundedValue)
    }

    func setSlider() {
        slider.minimumValue = Float(valueMin)
        slider.maximumValue = Float(valueMax)
    }
}


// MARK: Stepper
extension EditorView {
    func setStepper() {
        stepper.minimumValue = valueMin
        stepper.maximumValue = valueMax
        stepper.stepValue = step
    }

    @objc func changeStepperValue() {
        value = stepper.value
    }
}


protocol EditorDelegate {
    func didSelectItem(item: String, atIndex: Int)
    func getMin() -> Double
    func getMax() -> Double
    func getStep() -> Double
    func convertValue(value: Double, selectedItem: String) -> Double
}
