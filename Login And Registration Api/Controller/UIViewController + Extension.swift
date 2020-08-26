//
//  UIViewController + Extension.swift
//  Registration And Login API
//
//  Created by Mac on 09/06/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    class func instantiateFromStoryboard(_ name: String) -> Self{
        return instantiateFromStoryboardHelper(name)
    }
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller =  storyboard.instantiateViewController(identifier: "\(Self.self)") as! T
        return controller
    }
}
