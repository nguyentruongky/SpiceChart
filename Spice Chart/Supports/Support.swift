//
//  Support.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/2/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class View: UIView {
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() { }
}


extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }

}


extension Float {
    func formatNumber() -> String {
        let string = String(self)
        let components = string.split(separator: ".")
        if components.count > 1 {
            let decimal = String(components[1]).prefix(2)
            let value = String(components[0]) + "." + decimal
            print("Origin: \(string)\nFormatted: \(value)")
            return value
        }
        print("Origin: \(string)\nFormatted: \(string)")
        return string
    }
}

extension Double {
    func formatNumber() -> String {
        let string = String(self)
        let components = string.split(separator: ".")
        if components.count > 1 {
            let decimal = String(components[1]).prefix(2)
            let value = String(components[0]) + "." + String(decimal)
            print("Origin: \(string)\nFormatted: \(value)")
            return value
        }
        print("Origin: \(string)\nFormatted: \(string)")
        return string
    }
}

enum ElementType: String {
    case selection, text
}
