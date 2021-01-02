//
//  CameraView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-11-28.
//

import Foundation
import AVFoundation
import ARKit
import SceneKit
import SwiftUI

struct CameraView : UIViewControllerRepresentable {
    // Init your ViewController
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
        let controller = CameraViewController()
        return controller
    }
    
    
    // Tbh no idea what to do here
    func updateUIViewController(_ uiViewController: CameraView.UIViewControllerType, context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
}

class CameraViewController : UIViewController,ARSCNViewDelegate {
    
    var contentNode: SCNNode?
    
    var arView: ARSCNView {
        return self.view as! ARSCNView
    }
    override func loadView() {
        self.view = ARSCNView(frame: .zero)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.delegate = self
        let configuration = ARKit.ARFaceTrackingConfiguration()
        arView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let sceneView = renderer as? ARSCNView,
              anchor is ARFaceAnchor else { return nil }
        
        let faceGeometry = ARSCNFaceGeometry(device: sceneView.device!)!
        let material = faceGeometry.firstMaterial!
        material.fillMode = .lines
        material.lightingModel = .physicallyBased
        contentNode = SCNNode(geometry: faceGeometry)
        return contentNode
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceGeometry = node.geometry as? ARSCNFaceGeometry,
              let faceAnchor = anchor as? ARFaceAnchor
        else { return }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
    
    func update(withFaceAnchor anchor: ARFaceAnchor) {
        
            let leftEyeTransform = anchor.leftEyeTransform
            let rotate:matrix_float4x4 =
                simd_float4x4(SCNMatrix4Mult(SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0), SCNMatrix4MakeTranslation(0, 0, 0.1/2)))
            
    }
}

