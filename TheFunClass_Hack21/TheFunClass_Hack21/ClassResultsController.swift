//
//  ClassResultsController.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/2/21.
//
import UIKit

class ClassResultsController: UIViewController{
    let classResultsBackground = UIImageView()
    let classTable = UITableView()
    private var filterView: UICollectionView!
    
// data
    var classData:[Class] = []
    var filterData:[Filter] = []
    var popularData:[Class] = []
    var filteredArray: [Class] = []
    var allfiltersSelected:[String] = []
    var anyFilterSelected:Bool = false
    let classResults = UILabel()
    let refineMessage = UILabel()
    let specificationsTable = UITableView()
//    let classesTable = UITableView()
    let scheduleButton = UIButton()
    var classInput:[String] = []
    
//    identifiers + padding
    let classCellReuseIdentifier = "classCellReuseIdentifier"
    private let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    private let cellPadding: CGFloat = 16
    private let sectionPadding:CGFloat = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Class Results"
        setupViews()
        setupConstraints()
        dummyData()
        getClasses()

    }
    
    func getClasses(){
        for input in classInput{
            NetworkManager.getSearchClasses(query: input) { result in
//                for each course, get the course details
                for res in result{
                    NetworkManager.getSpecificClass(subject: res.subject, code: res.code ) { course in
//                        if course already not in classData array, append it
                        if !self.classData.contains(course){
                            self.classData.append(course)
                            self.classTable.reloadData()
                        }
                    }
                }
            }
        }

        
    }
    
    
    func dummyData(){
//        filter buttons
        let filter1 = Filter(name: "Difficulty")
        filterData.append(filter1)
        let filter2 = Filter(name: "Workload")
        filterData.append(filter2)
        let filter3 = Filter(name: "Popular")
        filterData.append(filter3)
    }
    
    func setupViews() {
        //change
        classResultsBackground.translatesAutoresizingMaskIntoConstraints = false
        classResultsBackground.image = UIImage(named: "classResultsBackground")
        view.addSubview(classResultsBackground)
        
        classResults.translatesAutoresizingMaskIntoConstraints = false
        classResults.font = UIFont.boldSystemFont(ofSize: 30)
        //change
        classResults.textColor = .white
        classResults.text = "Your Class Results"
        classResults.layer.shadowColor = UIColor.black.cgColor
        classResults.layer.shadowRadius = 5
        classResults.layer.shadowOffset = CGSize(width: 5, height: 3)
        classResults.layer.shadowOpacity = 1.0
        view.addSubview(classResults)
        
        refineMessage.translatesAutoresizingMaskIntoConstraints = false
        refineMessage.font = UIFont.boldSystemFont(ofSize: 16)
        refineMessage.textColor = .white
        refineMessage.text = "Refine"
        refineMessage.layer.shadowRadius = 5
        refineMessage.layer.shadowOffset = CGSize(width: 5, height: 3)
        refineMessage.layer.shadowOpacity = 1.0
        refineMessage.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(refineMessage)
        
//    main table
        classTable.translatesAutoresizingMaskIntoConstraints = false
        classTable.delegate = self
        classTable.dataSource = self
        classTable.separatorStyle = .none
        classTable.register(ClassTableViewCell.self, forCellReuseIdentifier: classCellReuseIdentifier)
        classTable.backgroundColor = .clear
        view.addSubview(classTable)
        
//    filter collection view
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumInteritemSpacing = cellPadding
        layout2.minimumLineSpacing = cellPadding
        layout2.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        filterView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.backgroundColor = UIColor.clear
        view.addSubview(filterView)
        
        filterView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier )
        filterView.dataSource = self
        filterView.delegate = self
        filterView.allowsMultipleSelection = false
    }
    
    func setupConstraints() {
        //change
        classResultsBackground.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        classResults.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(31)
        }
        refineMessage.snp.makeConstraints { make in
            make.top.equalTo(classResults.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(31)
        }
        classTable.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(170)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        filterView.snp.makeConstraints { make in
            make.top.equalTo(refineMessage.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(refineMessage.snp.bottom).offset(55)
        }
}
    
}
//table extensions
extension ClassResultsController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if anyFilterSelected == true{
            return filteredArray.count
        }else{
            return classData.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classCellReuseIdentifier , for: indexPath) as! ClassTableViewCell
        if anyFilterSelected == true{
            cell.configure(for: filteredArray[indexPath.row])

        }else{
            cell.configure(for: classData[indexPath.row])
        }
//        cell.layer.backgroundColor = UIColor.clear.cgColor

        return cell
    }
    }
//filter extensions
extension ClassResultsController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
        cell.configure(with: filterData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if anyFilterSelected == true{
            return filteredArray.count
        }
        return filterData.count
    }
}
extension ClassResultsController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)/4
        return CGSize(width: size, height: size/3)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filter = filterData[indexPath.item].name
        if filter == "Popular" {
            filteredArray = classData.sorted(by: {$0.CU_Reviews_Overall > $1.CU_Reviews_Overall})
        }
        else if filter == "Workload"{
            var negOneArray:[Class] = []
            var classDataCopy: [Class] = classData
            for course in classDataCopy {
                if course.CU_Reviews_Workload == -1 {
//                    let course.CU_Reviews_Workload = 0
                    let index = classDataCopy.firstIndex(of: course)
                    classDataCopy.remove(at: index!)
                    negOneArray.append(course)
                }
            }
            filteredArray = classDataCopy.sorted(by: {$0.CU_Reviews_Workload < $1.CU_Reviews_Workload}) + negOneArray

        }
        else if filter == "Difficulty" {
            var negTwoArray:[Class] = []
            var classDataCopy: [Class] = classData
            for course in classDataCopy {
                if course.CU_Reviews_Difficulty == -1 {
                    let index = classDataCopy.firstIndex(of: course)
                    classDataCopy.remove(at: index!)
                    negTwoArray.append(course)
                }
            }
            filteredArray = classDataCopy.sorted(by: {$0.CU_Reviews_Difficulty < $1.CU_Reviews_Difficulty}) + negTwoArray

        }
        anyFilterSelected = true
        self.classTable.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        filteredArray = classData
        anyFilterSelected = false
        self.classTable.reloadData()
    }
}
extension ClassResultsController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var classObject: Class
        if anyFilterSelected {
            classObject = filteredArray[indexPath.row]
        }
        else {
            classObject = classData[indexPath.row]
        }
        let destination = ClassSpecs()
        
        navigationController?.pushViewController(destination, animated: true)
        destination.classDescription.text = classObject.description
        destination.classTitle.text = classObject.subject + " " + String(classObject.code)
        destination.creditAmount.text = "Credit Amount: " + String(classObject.credit_count) + "     "
        destination.classDifficulty.text = "Class Difficulty: " + String(classObject.CU_Reviews_Difficulty)
        destination.classWorkload.text = "Class Workload: " + String(classObject.CU_Reviews_Workload)
        destination.className.text = classObject.name
        destination.classOverall.text = "Overall Rating: " + String(classObject.CU_Reviews_Overall)
    }
}

