//
//  DetailView.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/1/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class DetailView: View {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var servingValueLabel: UILabel!
    @IBOutlet weak var servingTitleLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!

    @IBAction func showServingValue(_ sender: Any) {
        let title = "Mg Per Serving " + nameLabel.text!.lowercased()
        let controller = UIAlertController(title: servingValueLabel.text, message: title, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default))
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.present(controller, animated: true)
    }

    func setTitle(name: String) {
        nameLabel.text = name
    }

    override func setupView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds

        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]

        addSubview(view)
    }
}
