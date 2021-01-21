//
//  Singleton.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2021-01-21.
//

import Foundation
import ARKit
import SwiftUI

class Singleton {
    static let sharedInstance = Singleton()

    var eyeLookAtPointXAxis = Float(0)
    
    var eyeLookAtPointYAxis = Float(0)
    
    var faceCallibratedPoints = ARSCNFaceGeometry.init()
    
    var faceAnchorCallibratedPoints = SCNNode()
    
    var timeStamp = Double(0)
    
    var calibrated = false
    
}
