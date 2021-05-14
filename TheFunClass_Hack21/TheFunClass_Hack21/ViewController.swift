//
//  ViewController.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/1/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //change
    let homeBackground = UIImageView()
    let logoImage = UIImageView()
    let appTitle = UILabel()
    let descriptionLabel = UILabel()
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "homeScreen")!)
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "appLogo")
        view.addSubview(logoImage)
        
        //change
        homeBackground.translatesAutoresizingMaskIntoConstraints = false
        homeBackground.image = UIImage(named: "homeScreen")
        view.addSubview(homeBackground)
        
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.font = UIFont.boldSystemFont(ofSize: 70)
        appTitle.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        appTitle.text = "The Fun Class"
        //change
        appTitle.numberOfLines = 2
        //change
        appTitle.textColor = .white
        appTitle.layer.shadowRadius = 15
        appTitle.layer.shadowOffset = CGSize(width: 5, height: 3)
        appTitle.layer.shadowOpacity = 1.0
        appTitle.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(appTitle)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        descriptionLabel.textColor = UIColor.init(red: 131/255, green: 131/255, blue: 131/255, alpha: 1)
        //change
        descriptionLabel.textColor = .white
        descriptionLabel.text = "Welcome to The Fun Class! We help Cornell students discover courses to take for fun that they will enjoy based on their interests and the class workload and difficulty levels!"
        descriptionLabel.numberOfLines = 5
        descriptionLabel.layer.shadowRadius = 5
        descriptionLabel.layer.shadowOffset = CGSize(width: 5, height: 3)
        descriptionLabel.layer.shadowOpacity = 1.0
        descriptionLabel.layer.shadowColor = UIColor.black.cgColor
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        //change
//        enterButton.backgroundColor = UIColor.init(red: 255/255, green: 75/255, blue: 75/255, alpha: 1)
        enterButton.backgroundColor = UIColor.init(red: 255/255, green: 126/255, blue: 85/255, alpha: 1)
        enterButton.layer.cornerRadius = 20
        enterButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        enterButton.setTitle("Enter App", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.shadowRadius = 15
        enterButton.layer.shadowOffset = CGSize(width: 10, height: 3)
        enterButton.layer.shadowOpacity = 0.8
        enterButton.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(enterButton)
    }
    
    func setupConstraints(){
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(142)
            make.height.equalTo(129)
        }
        
//change
        homeBackground.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        appTitle.snp.makeConstraints { make in
//change
//            make.top.equalTo(logoImage.snp.bottom).offset(10)
//            make.centerX.equalTo(self.view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.centerX.equalTo(self.view)
            //change
            make.leading.equalTo(self.view).offset(18)
            make.trailing.equalTo(self.view).offset(-18)
            
            
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(appTitle.snp.bottom).offset(250)
            make.centerX.equalTo(self.view)
            make.leading.equalTo(self.view).offset(18)
            make.trailing.equalTo(self.view).offset(-18)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
//            make.centerX.equalTo(self.view)
            make.rightMargin.equalTo(1)
            make.width.equalTo(206)
            make.height.equalTo(49)
        }
    }
    
    @objc func nextPage(){
        print("hello")
        let interesCon = InterestController()
        navigationController?.pushViewController(interesCon, animated: true)
    }
}



