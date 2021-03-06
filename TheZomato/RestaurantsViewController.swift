
import UIKit

class RestaurantsViewController: UIViewController_SwipeDismiss
{

    let restImage = UIImageView()
    let buttonBack = UIButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI()
    {
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
