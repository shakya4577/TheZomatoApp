
import UIKit

class HomeViewController: UIViewController
{
    let buttonOrder = UIButton()
    let backgroundImage = UIImageView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Zomato Home"
        initUI()
    }
    
    @objc func orderButtonClicked(sender: UIButton!) {
        let vc = RestaurantsViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    func initUI()
    {
//        let add =  UIBarButtonItem(title: "Add", style: .plain, target: self, action: nil)
//        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action:nil)
//
//        self.navigationController?.setToolbarItems([add,play], animated: false)
//        self.navigationController?.isToolbarHidden = false;
//
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.image = UIImage(named: "bgImg.jpeg");
        self.view.addSubview(backgroundImage);
        setBackgroundImageConts()
        buttonOrder.addTarget(self, action: #selector(self.orderButtonClicked(sender:)), for: .touchUpInside)
        buttonOrder.setTitle("Order", for: .normal)
        buttonOrder.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(buttonOrder)
        setButtonConstraint()
    }
    
    func setBackgroundImageConts()
    {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: backgroundImage, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: backgroundImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: backgroundImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: backgroundImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setButtonConstraint()
    {
        buttonOrder.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}

