/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A visualization indicating when part of a scanned bounding box has enough data for recognition.
 可视化指示扫描的边界框的一部分何时具有足够的数据用于识别。
*/

import UIKit
import SceneKit

class Tile: SCNNode {
    
    var isCaptured: Bool = false
    var isHighlighted: Bool = false
    
    func updateVisualization() {
        var newOpacity: CGFloat = isCaptured ? 0.5 : 0.0
        newOpacity += isHighlighted ? 0.35 : 0.0
        opacity = newOpacity
    }
    
    init(_ plane: SCNPlane) {
        super.init()
        self.geometry = plane
        self.opacity = 0.0
        
        // Create a child node with another plane of the same size, but a darker color to stand out better. 使用相同大小的另一个平面创建子节点，但颜色较深，以便更好地突出。
        // This helps users see captured tiles from the back.这有助于用户从后面查看捕获的图块。
        
        if childNodes.isEmpty {
            let innerPlane = SCNPlane(width: plane.width, height: plane.height)
            innerPlane.materials = [SCNMaterial.material(withDiffuse: UIColor.appBrown.withAlphaComponent(0.8), isDoubleSided: false)]
            let innerNode = SCNNode(geometry: innerPlane)
            innerNode.simdEulerAngles = float3(0, .pi, 0)
            addChildNode(innerNode)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
