//
//  ClassSpecsController.swift
//  TheFunClass_Hack21
//
//  Created by Rental User on 5/3/21.
//
import SnapKit
import UIKit
class ClassSpecs: UIViewController {
    //change
    let backgroundScreen = UIImageView()
    let classTitle = UILabel()
    let className = UILabel()
    let classDescription = UILabel()
    let whenOffered = UILabel()
    let whenOfferedLabel = UILabel()
    let preReqCoreReq = UILabel()
    let preReqCoreReqLabel = UILabel()
    let instructionMode = UILabel()
    let instructionModeLabel = UILabel()
    let time = UILabel()
    let timeLabel = UILabel()
    let weekDay = UILabel()
    let weekDayLabel = UILabel()
    let creditAmount = UILabel()
    let creditAmountLabel = UILabel()
    let classDifficulty = UILabel()
    let classDifficultyLabel = UILabel()
    let classOverallLabel = UILabel()
    let classOverall = UILabel()
    let classWorkload = UILabel()
    let classWorkloadLabel = UILabel()
//    let logoImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //background color
//            view.backgroundColor = .white
            setUpViews()
            setUpConstraints()
}
    func setUpViews(){
        //change
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.image = UIImage(named: "backgroundScreen")
        view.addSubview(backgroundScreen)
        
        creditAmount.translatesAutoresizingMaskIntoConstraints = false
        creditAmount.font = UIFont.boldSystemFont(ofSize: 20)
        creditAmount.textColor = .white
        creditAmount.numberOfLines = 1
        creditAmount.layer.shadowRadius = 7
        creditAmount.layer.shadowOffset = CGSize(width: 5, height: 3)
        creditAmount.layer.shadowOpacity = 0.8
        creditAmount.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(creditAmount)
        
        classTitle.translatesAutoresizingMaskIntoConstraints = false
        classTitle.font = UIFont.boldSystemFont(ofSize: 45)
        classTitle.textColor = .white
        classTitle.layer.shadowRadius = 7
        classTitle.layer.shadowOffset = CGSize(width: 5, height: 3)
        classTitle.layer.shadowOpacity = 0.8
        classTitle.layer.shadowColor = UIColor.black.cgColor
        classTitle.textAlignment = .center
        view.addSubview(classTitle)
        
        className.translatesAutoresizingMaskIntoConstraints = false
        className.font = UIFont.boldSystemFont(ofSize: 25)
        className.textColor = .white
        className.numberOfLines = 3
        className.layer.shadowRadius = 7
        className.layer.shadowOffset = CGSize(width: 5, height: 3)
        className.layer.shadowOpacity = 0.8
        className.layer.shadowColor = UIColor.black.cgColor
        className.textAlignment = .center
        className.adjustsFontSizeToFitWidth = true
        view.addSubview(className)
        
        classDescription.translatesAutoresizingMaskIntoConstraints = false
        classDescription.adjustsFontSizeToFitWidth = true
        classDescription.font = UIFont.boldSystemFont(ofSize: 12)
        classDescription.layer.shadowRadius = 7
        classDescription.layer.shadowOffset = CGSize(width: 5, height: 3)
        classDescription.layer.shadowOpacity = 0.8
        classDescription.layer.shadowColor = UIColor.black.cgColor
        classDescription.textColor = .white
        classDescription.numberOfLines = 18
        classDescription.textAlignment = .center
        view.addSubview(classDescription)
        
        whenOfferedLabel.translatesAutoresizingMaskIntoConstraints = false
        whenOfferedLabel.font = UIFont.boldSystemFont(ofSize: 20)
        whenOfferedLabel.textColor = UIColor.init(red: 255/255, green: 75/255, blue: 75/255, alpha: 1)
        whenOfferedLabel.text = "When Offered: "
        whenOfferedLabel.numberOfLines = 1
        view.addSubview(whenOfferedLabel)
        
        whenOffered.translatesAutoresizingMaskIntoConstraints = false
        whenOffered.font = UIFont.boldSystemFont(ofSize: 20)
        whenOffered.textColor = .white
        whenOffered.numberOfLines = 1
        view.addSubview(whenOffered)
        
        preReqCoreReq.translatesAutoresizingMaskIntoConstraints = false
        preReqCoreReq.font = UIFont.boldSystemFont(ofSize: 20)
        preReqCoreReq.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        preReqCoreReq.numberOfLines = 1
        view.addSubview(preReqCoreReq)
        preReqCoreReqLabel.translatesAutoresizingMaskIntoConstraints = false
        preReqCoreReqLabel.font = UIFont.boldSystemFont(ofSize: 20)
        preReqCoreReqLabel.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        preReqCoreReqLabel.numberOfLines = 1
        view.addSubview(preReqCoreReqLabel)
        
        instructionMode.translatesAutoresizingMaskIntoConstraints = false
        instructionMode.font = UIFont.boldSystemFont(ofSize: 20)
        instructionMode.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        instructionMode.numberOfLines = 1
        view.addSubview(instructionMode)
        
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont.boldSystemFont(ofSize: 20)
        time.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        time.numberOfLines = 1
        view.addSubview(time)
        
        weekDay.translatesAutoresizingMaskIntoConstraints = false
        weekDay.font = UIFont.boldSystemFont(ofSize: 20)
        weekDay.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        weekDay.numberOfLines = 1
        view.addSubview(weekDay)
        
        classDifficulty.translatesAutoresizingMaskIntoConstraints = false
        classDifficulty.font = UIFont.boldSystemFont(ofSize: 20)
        classDifficulty.textColor = .white
        classDifficulty.numberOfLines = 1
        classDifficulty.layer.shadowRadius = 7
        classDifficulty.layer.shadowOffset = CGSize(width: 5, height: 3)
        classDifficulty.layer.shadowOpacity = 0.8
        classDifficulty.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(classDifficulty)
        
        classWorkload.translatesAutoresizingMaskIntoConstraints = false
        classWorkload.font = UIFont.boldSystemFont(ofSize: 20)
        classWorkload.textColor = .white
        classWorkload.numberOfLines = 1
        classWorkload.layer.shadowRadius = 7
        classWorkload.layer.shadowOffset = CGSize(width: 5, height: 3)
        classWorkload.layer.shadowOpacity = 0.8
        classWorkload.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(classWorkload)
        
        classOverall.translatesAutoresizingMaskIntoConstraints = false
        classOverall.font = UIFont.boldSystemFont(ofSize: 20)
        classOverall.textColor = .white
        classOverall.numberOfLines = 1
        classOverall.layer.shadowRadius = 7
        classOverall.layer.shadowOffset = CGSize(width: 5, height: 3)
        classOverall.layer.shadowOpacity = 0.8
        classOverall.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(classOverall)
}
    
    func setUpConstraints(){
        //change
        backgroundScreen.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        //change
//        logoImage.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(70)
//            make.centerX.equalTo(self.view)
//            make.width.equalTo(73)
//            make.height.equalTo(67)
//        }
        
        classTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.centerX.equalTo(self.view)
        }
        
        className.snp.makeConstraints { make in
            make.top.equalTo(classTitle.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
        }
        
        classDescription.snp.makeConstraints { make in
            make.top.equalTo(className.snp.bottom).offset(19)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(150)
        }
        whenOffered.snp.makeConstraints { make in
            make.top.equalTo(classDescription.snp.bottom).offset(40)
            make.trailing.equalTo(-100)
        }
        preReqCoreReq.snp.makeConstraints { make in
            make.top.equalTo(whenOffered.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        instructionMode.snp.makeConstraints { make in
            make.top.equalTo(preReqCoreReq.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        time.snp.makeConstraints { make in
            make.top.equalTo(instructionMode.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        weekDay.snp.makeConstraints { make in
            make.top.equalTo(time.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        creditAmount.snp.makeConstraints { make in
            make.top.equalTo(classDescription.snp.bottom).offset(13)
            make.trailing.equalTo(-97)
        }
        classDifficulty.snp.makeConstraints { make in
            make.top.equalTo(creditAmount.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        classWorkload.snp.makeConstraints { make in
            make.top.equalTo(classDifficulty.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
        
        classOverall.snp.makeConstraints { make in
            make.top.equalTo(classWorkload.snp.bottom).offset(13)
            make.trailing.equalTo(-100)
        }
}
}
