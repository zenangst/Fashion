import Fashion

struct MainStylesheet: Stylesheet {
  
  func define() {
    share { (navigationBar: UINavigationBar) in
      navigationBar.translucent = false
      navigationBar.barTintColor = UIColor.blackColor()
      
      navigationBar.titleTextAttributes = [
        NSFontAttributeName : UIFont.boldSystemFontOfSize(18),
        NSForegroundColorAttributeName : UIColor.whiteColor()
      ]
    }
    
    share { (label: UILabel) in
      label.textColor = UIColor.blackColor()
      label.font = UIFont.systemFontOfSize(20)
      label.numberOfLines = 0
      label.textAlignment = .Center
    }
    
    register("content-view") { (view: UIView) in
      view.backgroundColor = UIColor.whiteColor()
    }
    
    register("card-view") { (view: UIView) in
      view.layer.masksToBounds = false
      view.layer.shadowColor = UIColor.blackColor().CGColor
      view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
      view.layer.shadowOpacity = 0.2
      view.layer.cornerRadius = 8
    }
  }
}