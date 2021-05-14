//
//  InterestController.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/2/21.
//

import UIKit

class InterestController: UIViewController {
    //change
    let backgroundScreen = UIImageView()
    let interestLabel = UILabel()
    let descriptionText = UILabel()
    let inputBox = UITextView()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the views
        
//        view.backgroundColor = .white
        title = "Interests"
        
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews(){
        
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.image = UIImage(named: "backgroundScreen")
        view.addSubview(backgroundScreen)
    
        
        interestLabel.translatesAutoresizingMaskIntoConstraints = false
        interestLabel.font = UIFont.boldSystemFont(ofSize: 25)
        interestLabel.textColor = .white
        interestLabel.text = "What are you interested in?"
        interestLabel.layer.shadowRadius = 5
        interestLabel.layer.shadowOffset = CGSize(width: 5, height: 3)
        interestLabel.layer.shadowOpacity = 1.0
        interestLabel.layer.shadowColor = UIColor.black.cgColor
        interestLabel.textAlignment = .center
        view.addSubview(interestLabel)

        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionText.textColor = .white
        descriptionText.text = "Input your interests separated by a comma (eg. history, design)"
        descriptionText.numberOfLines = 2
        descriptionText.layer.shadowRadius = 5
        descriptionText.layer.shadowOffset = CGSize(width: 5, height: 3)
        descriptionText.layer.shadowOpacity = 1.0
        descriptionText.layer.shadowColor = UIColor.black.cgColor
        descriptionText.textAlignment = .center
        view.addSubview(descriptionText)
        
        inputBox.translatesAutoresizingMaskIntoConstraints = false
        inputBox.font =  UIFont.boldSystemFont(ofSize: 25)
        inputBox.textContainerInset = UIEdgeInsets.zero;
        inputBox.textContainer.lineFragmentPadding = 0;
        inputBox.layer.cornerRadius = 5
        inputBox.layer.borderWidth = 1
        inputBox.layer.borderColor = UIColor(red: 0.742, green: 0.742, blue: 0.742, alpha: 1).cgColor
        inputBox.layer.shadowRadius = 5
        inputBox.layer.shadowOffset = CGSize(width: 5, height: 3)
        inputBox.layer.shadowOpacity = 1.0
        inputBox.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(inputBox)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.backgroundColor = UIColor.init(red: 255/255, green: 126/255, blue: 85/255, alpha: 1)
        submitButton.layer.cornerRadius = 20
        submitButton.addTarget(self, action: #selector(thirdPage), for: .touchUpInside)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.shadowRadius = 15
        submitButton.layer.shadowOffset = CGSize(width: 10, height: 3)
        submitButton.layer.shadowOpacity = 0.8
        submitButton.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(submitButton)
    }
    
    func setupConstraints(){
        //change
        backgroundScreen.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        interestLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(91)
            make.centerX.equalTo(self.view)

        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(interestLabel.snp.bottom).offset(20)
            make.width.equalTo(278)
            make.centerX.equalTo(self.view)
            
        inputBox.snp.makeConstraints { make in
            make.top.equalTo(descriptionText.snp.bottom).offset(37)
            make.leading.equalTo(35)
            make.trailing.equalTo(-35)
            make.height.equalTo(184)
            make.centerX.equalTo(self.view)
            
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(inputBox.snp.bottom).offset(33)
            make.width.equalTo(180)
            make.height.equalTo(41)
            make.rightMargin.equalTo(self.view).offset(-27)
        }
    }
    
    

}
}
}
    
    @objc func thirdPage(){
        let input = filterInput()
        let classResults = ClassResultsController()
        navigationController?.pushViewController(classResults, animated: true)
        classResults.classInput = input
        
//        TODO
//        need to reset classData everytime you press submit so we don't get duplicates every time page is loaded 
        classResults.classData = []
        
    }
    
    func filterInput() -> [String]{
        let split = inputBox.text?.split(separator: ",")
        var fin_array:[String] = []
        for word in split!{
            let str = String(word)
            let trim = str.trimmingCharacters(in: .whitespacesAndNewlines)
            fin_array.append(trim)
        }
        
        return fin_array
    }
    
}


