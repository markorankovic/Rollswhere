import SpriteKit
import GameplayKit

extension Sequence {
    
    public func filter<T>(_ type: T.Type) -> [T] {
        return compactMap{ $0 as? T }
    }
    
    func first<T>(_: T.Type) -> T? {
        return first{ $0 is T } as? T
    }
    
}

extension CGPoint {
    
    public func distanceFrom(_ point: CGPoint) -> CGFloat {
        return hypot(x - point.x, y - point.y)
    }
    
    public static func *(_ lhs: CGPoint, _ rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func /(_ lhs: CGPoint, _ rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    public static func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func +(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
}

extension GKScene {
    public func each<T: GKComponent>(_: T.Type) -> [T] {
        return entities.compactMap{ $0.components.first(T.self) }
    }
}



