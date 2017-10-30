//
//  Functions+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

func clamp(min minValue:CGFloat,max maxValue:CGFloat,_ value:CGFloat) -> CGFloat {
    return min(maxValue, max(minValue, value))
}

func proportion(min minValue: CGFloat, max maxValue: CGFloat, propMin: CGFloat, propMax: CGFloat, propValue: CGFloat) -> CGFloat {
    if propValue <= propMin {
        return minValue
    }
    else if propValue >= propMax {
        return maxValue
    }
    else {
        return minValue + (maxValue - minValue) * (propValue - propMin) / (propMax - propMin)
    }
}

func colorProportion(min minValue: UIColor, max maxValue: UIColor, propMin: CGFloat, propMax: CGFloat, propValue: CGFloat) -> UIColor {
    if propValue <= propMin {
        return minValue
    }
    else if propValue >= propMax {
        return maxValue
    }
    else {
        var minRed: CGFloat = 0.0, minGreen: CGFloat = 0.0, minBlue: CGFloat = 0.0, minAlpha: CGFloat = 0.0
        minValue.getRed(&minRed, green: &minGreen, blue: &minBlue, alpha: &minAlpha)
        
        var maxRed: CGFloat = 0.0, maxGreen: CGFloat = 0.0, maxBlue: CGFloat = 0.0, maxAlpha: CGFloat = 0.0
        maxValue.getRed(&maxRed, green: &maxGreen, blue: &maxBlue, alpha: &maxAlpha)
        
        return UIColor(red: proportion(min: minRed, max: maxRed, propMin: propMin, propMax: propMax, propValue: propValue),
                       green: proportion(min: minGreen, max: maxGreen, propMin: propMin, propMax: propMax, propValue: propValue),
                       blue: proportion(min: minBlue, max: maxBlue, propMin: propMin, propMax: propMax, propValue: propValue),
                       alpha: proportion(min: minAlpha, max: maxAlpha, propMin: propMin, propMax: propMax, propValue: propValue))
    }
}
