
import UIKit

class SearchViewController: UIViewController_SwipeDismiss
{

    let searchImage = UIImageView()
    let buttonBack = UIButton()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initUI()
    }
    func initUI()
    {
        searchImage.image = UIImage(named: "foodSearch.png")
        self.view.addSubview(searchImage)
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
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: searchImage, attribute: .left, relatedBy: .equal, toItem: view, attribute:.left, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: searchImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: searchImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: searchImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: self.view.frame.height)
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
