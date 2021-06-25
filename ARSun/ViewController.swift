//
//  ViewController.swift
//  ARSun
//
//  Created by Kenny on 2021/6/25.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    // MARK: - Properties
    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        creatCube()
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ARWorldTrackingConfiguration.isSupported {
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()

            // Run the view's session
            sceneView.session.run(configuration)
        }
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - Methods
    private func creatCube() {
        
        let sphere = SCNSphere(radius: 0.2)
        
        let meterial = SCNMaterial()
        
        meterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpeg")
        
        sphere.materials = [meterial]

        let node = SCNNode()

        node.position = SCNVector3(0, 0.1, -0.5)

        node.geometry = sphere

        sceneView.scene.rootNode.addChildNode(node)
        
        // 陰影效果
        sceneView.autoresizesSubviews = true
    }
}
