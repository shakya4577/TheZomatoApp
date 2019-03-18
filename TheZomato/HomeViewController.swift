
import UIKit

class HomeViewController: UIViewController
{
    let buttonRestaurant = UIButton()
    let buttonSearch = UIButton()
    let backgroundImage = UIImageView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Zomato Home"
        initUI()
    }
    
    @objc func buttonClicked(sender: UIButton!)
    {
        var vc:UIViewController_SwipeDismiss = UIViewController_SwipeDismiss();
        switch sender {
        case buttonRestaurant:
            vc = RestaurantsViewController()
        case buttonSearch:
            vc = SearchViewController()
        default:
            break
        }
        vc.modalPresentationStyle = .overFullScreen;
        self.present(vc, animated: false, completion: nil)
    }
    
    func initUI()
    {
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.image = UIImage(named: "bgImg.jpeg");
        self.view.addSubview(backgroundImage);
        setBackgroundImageConts()
        
        buttonRestaurant.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        buttonRestaurant.setTitle("Restaurant", for: .normal)
        buttonRestaurant.setTitleColor(UIColor.blue, for: .normal)
        buttonRestaurant.backgroundColor = UIColor.white
        self.view.addSubview(buttonRestaurant)
        setRestButtonConstraint()
        
        buttonSearch.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        buttonSearch.setTitle("Search", for: .normal)
        buttonSearch.setTitleColor(UIColor.blue, for: .normal)
        buttonSearch.backgroundColor = UIColor.white
        self.view.addSubview(buttonSearch)
        setSearchButtonConstraint()
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
    
    func setRestButtonConstraint()
    {
        buttonRestaurant.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: buttonRestaurant, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonRestaurant, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: buttonRestaurant, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.width/2)
        let heightConstraint = NSLayoutConstraint(item: buttonRestaurant, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setSearchButtonConstraint()
    {
        buttonSearch.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: buttonSearch, attribute: .left, relatedBy: .equal, toItem: buttonRestaurant, attribute: .right, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: buttonSearch, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: buttonSearch, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.width/2)
        let heightConstraint = NSLayoutConstraint(item: buttonSearch, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}

