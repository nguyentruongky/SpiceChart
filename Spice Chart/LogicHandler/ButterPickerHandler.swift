//
//  ButterPickerHandler.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/2/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit
class ButterPickerHandler: NSObject, EditorDelegate {
    private enum Item: String {
        case Tablespoons, Cups
    }
    var selectedIndex: Int?

    let datasource = [Item.Tablespoons.rawValue, Item.Cups.rawValue]

    var editor: ElementEditor?
    init(editor: ElementEditor) {
        super.init()
        self.editor = editor
        editor.delegate = self
    }

    var min: Double = 0
    var max: Double = 0
    var step: Double = 0

    func didSelectItem(item: String, atIndex: Int) {
        if item.lowercased() == Item.Tablespoons.rawValue.lowercased() {
            min = 0
            max = 160
            step = 1
        } else {
            min = 0
            max = 10
            step = 0.01
        }
        self.selectedIndex = atIndex
    }

    func getMax() -> Double {
        return max
    }

    func getMin() -> Double {
        return min
    }

    func getStep() -> Double {
        return step
    }

    func convertValue(value: Double, selectedItem: String) -> Double {
        var convertedValue: Double
        if selectedItem == Item.Tablespoons.rawValue {
            convertedValue = value * 16
            convertedValue = Double(Int(convertedValue))
        } else {
            convertedValue = value / 16
            convertedValue = (convertedValue * 1000) / 1000
        }


        return convertedValue
    }
}


