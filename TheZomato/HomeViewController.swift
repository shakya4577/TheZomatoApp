
import UIKit

class HomeViewController: UIViewController
{
    let buttonOrder = UIButton()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Zomato Home"
        initOrderButton()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        
    }
    
    @objc func orderPressed(sender: UIButton!) {
        let vc = RestaurantsViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    func initOrderButton()
    {
        buttonOrder.addTarget(self, action: #selector(self.orderPressed(sender:)), for: .touchUpInside)
        buttonOrder.setTitle("Order", for: .normal)
        buttonOrder.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(buttonOrder)
        setButtonConstraint()
    }
    
    func setButtonConstraint()
    {
        buttonOrder.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: buttonOrder, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}

