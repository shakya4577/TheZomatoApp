
import UIKit

class UIViewController_SwipeDismiss : UIViewController
{
    var startCoordinates: CGPoint = CGPoint(x: 0,y: 0)
    
    override func viewDidLoad()
    {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
    public func initPanGesture()
    {
       
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer)
    {
        let currentCoordinates = sender.location(in: self.view?.window)
        switch sender.state {
        case .began:startCoordinates = currentCoordinates;
        case .changed:
            do
            {
                if currentCoordinates.y - self.startCoordinates.y > 0
                {
                    self.view.frame = CGRect(x: 0, y: currentCoordinates.y - self.startCoordinates.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
                }
            }
        case .ended,.cancelled :
            do {
                if currentCoordinates.y - self.startCoordinates.y > 150
                {
                    self.dismiss(animated: true, completion: nil)
                }
                else
                {
                    UIView.animate(withDuration: 0.5, animations:
                        {
                            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                    })
                }
            }
        default: break
            
        }
    }
}
