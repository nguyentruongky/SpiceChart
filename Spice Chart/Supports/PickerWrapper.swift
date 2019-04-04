//
//  PickerWrapper.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/1/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit
class PickerWrapper: View, UIPickerViewDelegate, UIPickerViewDataSource {
    var datasource = [String]() { didSet {
        guard datasource.isEmpty == false else { return }
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }}
    let pickerView = UIPickerView()
    weak var owner: ElementEditor?

    override func setupView() {
        func makeButton(title: String) -> UIButton {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        pickerView.delegate = self
        pickerView.dataSource = self

        let doneButton = makeButton(title: "Close")
        addSubview(doneButton)
        doneButton.topRight(toView: self, top: 8, right: -8)
        doneButton.addTarget(self, action: #selector(removePicker), for: .touchUpInside)

        addSubview(pickerView)
        pickerView.horizontal(toView: self)
        pickerView.bottom(toView: self)
        pickerView.height(180)
        pickerView.verticalSpacing(toView: doneButton, space: 8)
    }

    @objc func removePicker() {
        removeFromSuperview()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datasource.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datasource[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        owner?.setSelectedItem(at: row)
    }
}
