//
//  ClassTableViewCell.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/3/21.
//        view.backgroundColor = UIColor(white: 1, alpha: 0.5)

import UIKit

class ClassTableViewCell: UITableViewCell {
    private var classView: UIView = UIView()
    private var className: UILabel = UILabel()
    private var credits: UILabel = UILabel()
    private var classDescription: UILabel = UILabel()
    private var longName: UILabel = UILabel()
    private var difficulty: UILabel = UILabel()
    private var workload: UILabel = UILabel()
    private var overall: UILabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for classObject: Class){
        className.text = classObject.subject + " " + String(classObject.code)
        credits.text = String(classObject.credit_count)+" Credits"
        longName.text = classObject.name
        difficulty.text = "Difficulty: "+String(classObject.CU_Reviews_Difficulty)+"/5"
        workload.text = "Workload: "+String(classObject.CU_Reviews_Workload)+"/5"
        overall.text = "Overall:"+String(classObject.CU_Reviews_Overall)+"/5"
    }
    
    func setupViews(){
        
        className.translatesAutoresizingMaskIntoConstraints = false
        className.font = UIFont.boldSystemFont(ofSize: 16)
        className.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(className)
        
        credits.translatesAutoresizingMaskIntoConstraints = false
        credits.font = UIFont.boldSystemFont(ofSize: 12)
        credits.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(credits)
        
        longName.translatesAutoresizingMaskIntoConstraints = false
        longName.font = UIFont.boldSystemFont(ofSize: 12)
        longName.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(longName)
        
        workload.translatesAutoresizingMaskIntoConstraints = false
        workload.font = UIFont.boldSystemFont(ofSize: 12)
        workload.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(workload)
        
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.font = UIFont.boldSystemFont(ofSize: 12)
        difficulty.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(difficulty)
        
        overall.translatesAutoresizingMaskIntoConstraints = false
        overall.font = UIFont.boldSystemFont(ofSize: 12)
        overall.textColor = UIColor.init(red: 53/255, green: 47/255, blue: 47/255, alpha: 1)
        contentView.addSubview(overall)
    }
    
    func setupConstraints(){
        
        className.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
        }
        
        credits.snp.makeConstraints { make in
            make.top.equalTo(className.snp.bottom).offset(4)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
        }
        
        longName.snp.makeConstraints { make in
            make.top.equalTo(credits.snp.bottom).offset(9)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
        }
        
        difficulty.snp.makeConstraints { make in
            make.top.equalTo(longName.snp.bottom).offset(15)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
        }
        
        workload.snp.makeConstraints { make in
            make.top.equalTo(difficulty)
            make.leading.equalTo(difficulty.snp.trailing).offset(10)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
        }
        overall.snp.makeConstraints { make in
            make.top.equalTo(workload)
            make.leading.equalTo(workload.snp.trailing).offset(10)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
        }
        
    }

}
