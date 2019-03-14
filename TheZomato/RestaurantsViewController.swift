
import UIKit

class RestaurantsViewController: UIViewController {

    let restImage = UIImageView()
    var startCoordinates: CGPoint = CGPoint(x: 0,y: 0)
    let buttonBack = UIButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Resturent page"
       initUI()
    }
    
    func initUI()
    {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        self.view.addGestureRecognizer(panGesture)
        
        restImage.image = UIImage(named: "zmbg.png")
        self.view.addSubview(restImage)
        setBackgroundImageButtonConstraint()
        
        buttonBack.setImage(UIImage(named: "downImg.png"), for: .normal)
        buttonBack.addTarget(self, action: #selector(self.backbuttonClicked(sender:)), for: .touchUpInside)
        self.view.addSubview(buttonBack)
        setBackButtonConstraint()
    }
    
    @objc func backbuttonClicked(sender: UIButton!) {
        self.dismiss(animated: false, completion: nil)
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
    
    func setBackgroundImageButtonConstraint()
    {
        restImage.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: restImage, attribute: .left, relatedBy: .equal, toItem: view, attribute:.left, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: restImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: restImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: restImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: self.view.frame.height)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setBackButtonConstraint()
    {
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: buttonBack, attribute: .centerX, relatedBy: .equal, toItem: view, attribute:.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonBack, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
        let widthConstraint = NSLayoutConstraint(item: buttonBack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let heightConstraint = NSLayoutConstraint(item: buttonBack, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }


}
