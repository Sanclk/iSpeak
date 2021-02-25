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
    // Init the ViewController
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
        let controller = CameraViewController()
        return controller
    }


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


    let configuration = ARKit.ARFaceTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        arView.delegate = self
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

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        print("Session failed. Changing worldAlignment property.")
        print(error.localizedDescription)

        if let arError = error as? ARError {
            switch arError.errorCode {
            case 102:
                configuration.worldAlignment = .gravity
                restartSessionWithoutDelete()
            default:
                restartSessionWithoutDelete()
            }
        }
    }

    func restartSessionWithoutDelete() {
        // Restart session with a different worldAlignment - prevents bug from crashing app
        self.arView.session.pause()

        self.arView.session.run(configuration, options: [
                                    .resetTracking,
                                    .removeExistingAnchors])
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceGeometry = node.geometry as? ARSCNFaceGeometry,
              let faceAnchor = anchor as? ARFaceAnchor
        else { return }


        //Use the gaze position, Face position, leftEyeTransform and RightEye transform as a callibration point. And make log when the tracking is off the feather value
        let oldPointX = Singleton.sharedInstance.eyeLookAtPointXAxis
        let oldPointY = Singleton.sharedInstance.eyeLookAtPointXAxis
        let oldTime = Singleton.sharedInstance.timeStamp
        Singleton.sharedInstance.eyeLookAtPointXAxis = faceAnchor.lookAtPoint.x
        Singleton.sharedInstance.eyeLookAtPointYAxis = faceAnchor.lookAtPoint.y

        if Singleton.sharedInstance.calibrated == false{
            if ((Singleton.sharedInstance.eyeLookAtPointXAxis - oldPointX) > 0.2 || (Singleton.sharedInstance.eyeLookAtPointXAxis - oldPointX) < -0.2 || (Singleton.sharedInstance.eyeLookAtPointYAxis - oldPointY) < -0.2 || (Singleton.sharedInstance.eyeLookAtPointYAxis - oldPointY) < -0.2){

                Singleton.sharedInstance.calibrated = false
                Singleton.sharedInstance.timeStamp = NSDate().timeIntervalSince1970
                NSLog(Singleton.sharedInstance.eyeLookAtPointXAxis.description + " Look at point")

                NSLog(oldPointX.description + " Old point")
                NSLog("Sum "+(Singleton.sharedInstance.eyeLookAtPointXAxis - oldPointX).description)

            }else{
                let oldTimeNSDate = NSDate(timeIntervalSince1970: oldTime)

                let secs = NSDate().timeIntervalSince(oldTimeNSDate as Date)

                let ti = NSInteger(secs)

                let seconds = ti % 60

                NSLog("Time gap " + String(seconds))
                if Singleton.sharedInstance.calibrated == false{

                    if seconds >= 5 && seconds < 8{
                        Singleton.sharedInstance.calibrated = true
                        DispatchQueue.global(qos: .background).async {
                            let utterance = AVSpeechUtterance(string: "Calibration complete")
                            utterance.rate = 0.5
                            let synthesizer = AVSpeechSynthesizer()
                            synthesizer.speak(utterance)
                        }
                        Singleton.sharedInstance.faceCallibratedPoints = faceGeometry
                        Singleton.sharedInstance.faceAnchorCallibratedPoints = node

                    }
                    if seconds > 8 {
                        Singleton.sharedInstance.calibrated = false
                        Singleton.sharedInstance.timeStamp = NSDate().timeIntervalSince1970
                    }
                }
            }
        }else{

        }


        faceGeometry.update(from: faceAnchor.geometry)
    }

    //    func update(withFaceAnchor anchor: ARFaceAnchor) {
    //        anchor.rightEyeTrans
    //    }
}

