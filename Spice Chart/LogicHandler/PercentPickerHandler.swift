//
//  SpicesPercentageHandler.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/2/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class PercentPickerHandler: NSObject, EditorDelegate {
    var editor: EditorView?
    init(editor: EditorView) {
        super.init()
        self.editor = editor
        editor.delegate = self
    }

    var min: Double = 0
    var max: Double = 100
    var step: Double = 0.1

    func didSelectItem(item: String, atIndex: Int) { }

    func getMax() -> Double {
        return max
    }

    func getMin() -> Double {
        return min
    }

    func getStep() -> Double {
        return step
    }

    func convertValue(value: Double, selectedItem: String) -> Double { return 0 }
}



