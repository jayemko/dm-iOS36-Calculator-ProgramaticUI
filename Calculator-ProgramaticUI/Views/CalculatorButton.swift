//
//  CalculatorButton.swift
//  Calculator-ProgramaticUI
//
//  Created by Jason Koceja on 10/13/20.
//

import UIKit

enum TipButtonType {
    case tip0Button
    case tip5Button
    case tip10Button
    case tip15Button
    case tip20Button
}

class CalculatorButton: UIButton {
    
    // MARK: - Properties

    var tipButtonType: TipButtonType = .tip0Button
    
    var isChosen = false {
        didSet {
            switch isChosen {
                case true:
                    viewForChosen()
                case false:
                    viewForDefault()
            }
        }
    }
    
    // MARK: - Lifecycle

    
    
    // MARK: - Helpers
    
    func viewForChosen() {
        self.setBackgroundColor(.orange, for: .normal)
        self.addAccentBorder(width: 8, color: CalculatorColor.backgroundColorForChosen)
        self.setTitleColor(CalculatorColor.titleColorForChosen, for: .normal)
        self.addCornerRadius(radius: 4)
        self.layer.masksToBounds = true
    }
    
    func viewForDefault() {
        
    }
    
    func tipAmount() -> Double {
        switch self.tipButtonType {
            case .tip0Button:
                return 0.0
            case .tip5Button:
                return 5.0
            case .tip10Button:
                return 10.0
            case .tip15Button:
                return 15.0
            case .tip20Button:
                return 20.0
        }
    }
    
    func tipAmountString() -> String {
        switch self.tipButtonType {
            case .tip0Button:
                return "0%"
            case .tip5Button:
                return "5%"
            case .tip10Button:
                return "10%"
            case .tip15Button:
                return "15%"
            case .tip20Button:
                return "20%"
        }
    }

    // MARK: - View
}

extension CalculatorButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(image(with:color), for: state)
    }
    
    private func image(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

struct CalculatorColor {
    static let backgroundColorForDefault: UIColor = {
        isChosen ? .orange : .peach
    }()
    static let accentBorderForDefault: UIColor = .borderHighlight
    static let titleColorForDefaultl: UIColor = .ltTaupe
    static let backgroundColorForChosen: UIColor = .orange
    static let accentBorderForChosen: UIColor = .white
    static let titleColorForChosen: UIColor = .white
}
