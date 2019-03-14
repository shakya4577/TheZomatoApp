
import UIKit

class RestaurantsViewController: UIViewController {

    let restImage = UIImageView()
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    let buttonBack = UIButton()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Resturent page"
        self.modalPresentationStyle = .overFullScreen;
        initUI()
    }
    
    func initUI()
    {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        self.view.addGestureRecognizer(panGesture)
        
        restImage.image = UIImage(named: "restImageOne")
        self.view.addSubview(restImage)
        setRestImageButtonConstraint()
        
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
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizer.State.began
        {
            initialTouchPoint = touchPoint
         }
        else if sender.state == UIGestureRecognizer.State.changed
        {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
        else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled
        {
            if touchPoint.y - initialTouchPoint.y > 100
            {
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                UIView.animate(withDuration: 0.3, animations:
               {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    func setRestImageButtonConstraint()
    {
        restImage.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: restImage, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: restImage, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: restImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: restImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setBackButtonConstraint()
    {
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: buttonBack, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonBack, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 50)
        let widthConstraint = NSLayoutConstraint(item: buttonBack, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        let heightConstraint = NSLayoutConstraint(item: buttonBack, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }


}
