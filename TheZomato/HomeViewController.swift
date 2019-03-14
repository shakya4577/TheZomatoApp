
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
        vc.modalPresentationStyle = .overFullScreen;
        self.present(vc, animated: false, completion: nil)
    }
    
    func initUI()
    {

        backgroundImage.contentMode = .scaleToFill
        backgroundImage.image = UIImage(named: "bgImg.jpeg");
        self.view.addSubview(backgroundImage);
        setBackgroundImageConts()
        buttonOrder.addTarget(self, action: #selector(self.orderButtonClicked(sender:)), for: .touchUpInside)
        buttonOrder.setTitle("Order", for: .normal)
        buttonOrder.setTitleColor(UIColor.blue, for: .normal)
        buttonOrder.backgroundColor = UIColor.white
        self.view.addSubview(buttonOrder)
        setButtonConstraint()
    }
    
    func setBackgroundImageConts()
    {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: backgroundImage, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: backgroundImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: backgroundImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: backgroundImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.height)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setButtonConstraint()
    {
        buttonOrder.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonOrder, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: buttonOrder, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: buttonOrder, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}

