//
//  AddItemsVC.swift
//  Keep
//
//  Created by Luna An on 1/16/17.
//  Copyright © 2017 Mimicatcodes. All rights reserved.
//

import UIKit
import RealmSwift

class AddItemsVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UIBarPositioningDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    var store = DataStore.sharedInstance
    var originalTopMargin:CGFloat!
    var location:Location = .Fridge
    var quantity: Int = 1
    var labelView: UILabel!
    let picker = UIPickerView()
    let datePicker1 = UIDatePicker()
    let datePicker2 = UIDatePicker()
    var activeTextField:UITextField?
    let formatter = DateFormatter()
    var nameTitle = ""
    var selectedIndex: Int = 0
    var selectedExpIndex: Int?
    var allItems = Array(DataStore.sharedInstance.allItems)
    var filteredItems = [Item]()
    var filteredItemsNames = [String]()
    
    var purchaseDate = Date()
    var expDate = Date()
    
    var list = ["1","2","3","4","5","6"]
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet var bodyViews: [UIView]!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityMinusButton: UIButton!
    @IBOutlet weak var purchaseDateTextfield: UITextField!
    @IBOutlet weak var expDateTextfield: UITextField!
    @IBOutlet var locationViews: [UIView]!
    @IBOutlet var locationButtons: [UIButton]!
    @IBOutlet var locationLabels: [UILabel]!
    @IBOutlet var expButtons: [UIButton]!
    @IBOutlet weak var categoryTextfield: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        customToolBarForPickers()
        quantityLabel.layer.borderWidth = 1
        quantityLabel.layer.borderColor = Colors.mainBorder.cgColor
        formatInitialData()
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = Colors.mainBorder.cgColor
        tableView.layer.borderWidth = 1.0
        tableView.separatorInset = .zero
        formatDates()
        hideKeyboard()
        tableView.isHidden = true
        picker.delegate = self
        picker.dataSource = self
        nameTextField.delegate = self
        nameTextField.autocapitalizationType = .words
        categoryTextfield.autocapitalizationType = .words
        categoryTextfield.delegate = self
        categoryTextfield.inputView = picker
        nameTextField.text = nameTitle
        favButton.isSelected = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatInitialData()
        print(nameTitle)
        formatDates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        originalTopMargin = topMarginConstraint.constant
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
    }
    // picker for category dropdown
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextfield.text = list[row]
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: tableView))! {
            return false
        } else {
            return true
        }
    }
    
    override func viewDidLayoutSubviews() {
        heightConstraint.constant = 80
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == nameTextField {
            let substring = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            searchAutocompleteEntriesWithSubstring(substring)
            return true
        }
        return true
    }
    
    
    func searchAutocompleteEntriesWithSubstring(_ substring: String) {
        
        //filteredItems.removeAll(keepingCapacity: false)
        filteredItemsNames.removeAll(keepingCapacity: false)
        
        for itemArray in allItems_ {
            for item in itemArray {
                //let myString: NSString! = item.name as NSString
                let myString: NSString! = item as NSString
                let substringRange: NSRange! = myString.range(of: substring)
                
                if substringRange.location == 0 {
                    //filteredItems.append(item)
                    filteredItemsNames.append(item)
                }
            }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if filteredItems.count == 0 {
        if filteredItemsNames.count == 0 {
            //return allItems.count
            return list.count
        }
        //return filteredItems.count
        return filteredItemsNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell")
        
        //if filteredItems.count == 0 {
        if filteredItemsNames.count == 0 {
            tableView.isHidden = true
            // ---- Dummy data ----------------------
            cell?.textLabel?.text = list[indexPath.row]
            // ---- Dummy data ----------------------
            
        } else {
            tableView.isHidden = false
            
            //cell?.textLabel?.text = self.filteredItems[indexPath.row].name
            
            cell?.textLabel?.text = self.filteredItemsNames[indexPath.row]
        }
        
        cell?.textLabel?.font = UIFont(name: Fonts.latoRegular, size: 13)
        cell?.textLabel?.textColor = Colors.mainBorder
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        nameTextField.text = selectedCell.textLabel!.text!.capitalized
        DispatchQueue.main.async {
            self.tableView.isHidden = !tableView.isHidden

        }
        print("!!!!!!!!")
        nameTextField.endEditing(true)
    }
    
    func formatDates(){
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "MMM dd, yyyy"
    }
    
    func customToolBarForPickers(){
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.darkGray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        categoryTextfield.inputAccessoryView = toolBar
        expDateTextfield.inputAccessoryView = toolBar
        purchaseDateTextfield.inputAccessoryView = toolBar
        
    }
    
    func donePicker(sender:UIBarButtonItem) {
        
        view.isUserInteractionEnabled = true
        activeTextField?.resignFirstResponder()
        moveViewDown()
        
    }
    
    @IBAction func didPressFavBtn(_ sender: UIButton) {
        
        favButton.isSelected = !favButton.isSelected
        
        if favButton.isSelected {
            print("Fav selected")
            
        } else {
            print("Not selected")
        }
    }
    
    @IBAction func didPressExpDateBtn(_ sender: UIButton) {
        
        let index_ = sender.tag
        
        switch index_ {
            
        case 0:
            let today = Date()
            let fiveDaysLater = Calendar.current.date(byAdding: .day, value: 5, to: today)
            if let date = fiveDaysLater {
                expDate = date
                expDateTextfield.text = formatter.string(from: date).capitalized
            }
            moveViewDown()
            print("5 Days")
            
        case 1:
            let today = Date()
            let sevenDaysLater = Calendar.current.date(byAdding: .day, value: 7, to: today)
            if let date = sevenDaysLater {
                expDate = date
                expDateTextfield.text = formatter.string(from: date).capitalized
            }
            moveViewDown()
            print("7 Days")
            
        case 2:
            let today = Date()
            let twoWeeksLater = Calendar.current.date(byAdding: .day, value: 14, to: today)
            if let date = twoWeeksLater {
                expDate = date
                expDateTextfield.text = formatter.string(from: date).capitalized
            }
            moveViewDown()
            print("14 Days")
            
        case 3:
            let today = Date()
            let neverExpire = Calendar.current.date(byAdding: .day, value: 1095, to: today)
            expDate = neverExpire! // 3 years later
            expDateTextfield.text = "None"
            print("Never")
            
            moveViewDown()
            
        default:
            break
            
        }

        for (index,button) in expButtons.enumerated() {
            
            if index == index_ {
                button.isSelected = true
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 2
                button.layer.borderColor = Colors.main.cgColor
                button.setTitleColor(Colors.main, for: .selected)
            } else {
                button.isSelected = false
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                button.layer.borderColor = Colors.border.cgColor
                button.setTitleColor(Colors.button, for: .normal)
            }
        }
    }
    
    
    @IBAction func didPressLocationBtn(_ sender: UIButton) {
        
        selectedIndex = sender.tag
        
        switch selectedIndex {
        case 0:
            self.location = .Fridge
            print("-------Fridge btn tapped: location is \(location)")
        case 1:
            self.location = .Freezer
            print("-------Freezer btn tapped: location is \(location)")
        case 2:
            self.location = .Pantry
            print("-------Pantry btn tapped: location is \(location)")
        case 3:
            self.location = .Other
            print("-------Other btn tapped: location is \(location)")
        default:
            break
            
        }
        
        for (index,button) in locationButtons.enumerated() {
            
            if index == selectedIndex {
                button.isSelected = true
                
                button.backgroundColor = .clear
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 2
                button.layer.borderColor = Colors.main.cgColor
                
                locationLabels[index].textColor = Colors.main
                
                
            } else {
                button.isSelected = false
                
                button.backgroundColor = .clear
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.clear.cgColor
                
                locationLabels[index].textColor = Colors.button
                
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        nameTitle = ""
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        saveButton.isEnabled = false
        
        guard let name = nameTextField.text else { return }
        guard let category = categoryTextfield.text else { return }
        
        let item = Item(name: name.capitalized, quantity: String(quantity), exp: expDate, purchaseDate: purchaseDate, isConsumed: false, location: location.rawValue, category: category.capitalized)
        
        let realm = try! Realm()
        try! realm.write {
            
            realm.add(item)
            if favButton.isSelected {
                item.isFavorited = true
                if item.isFavorited == true {
                    let favItem = FavoritedItem(name: item.name)
                    realm.add(favItem)
                    print("fav item is \(item.isFavorited) AND \(favItem.name) has been added to realm's fv items")
                }
            } else {
                item.isFavorited = false
                print("completed")
            }
            print("***** \(item.name) is added to realm database in \(item.category) in \(item.location) ***** AND \(item.exp)")
        }
        showAlert()
        resetAddItems()
        
    }
    
    @IBAction func quantityMinusBtnTapped(_ sender: Any) {
        
        moveViewDown()
        if quantity == 1 {
            quantityMinusButton.isEnabled = false
        } else {
            quantityMinusButton.isEnabled = true
            quantity -= 1
            quantityLabel.text = "\(quantity)"
        }
    }
    
    @IBAction func quantityPlusBtnTapped(_ sender: Any) {
        
        moveViewDown()
        quantity += 1
        quantityLabel.text = "\(quantity)"
        if quantityMinusButton.isEnabled == false {
            quantityMinusButton.isEnabled = true
            
        }
    }
    
    func showAlert() {
        
        labelView = UILabel(frame: CGRect(x: 0, y: 65, width: self.view.frame.width, height: 40))
        labelView.backgroundColor = Colors.added
        labelView.text = "Item added"
        labelView.textAlignment = .center
        labelView.textColor = UIColor.white
        labelView.font = UIFont(name: Fonts.montserratRegular, size: 12)
        
        self.view.addSubview(labelView)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
        
    }
    
    func dismissAlert(){
        
        if labelView != nil {
            
            labelView.removeFromSuperview()
            
        }
    }
    
    func formatInitialData() {
        
        DispatchQueue.main.async {
            self.nameTextField.text = self.nameTitle
        }
        tableView.isHidden = true
        categoryTextfield.text = ""
        quantity = 1
        quantityLabel.text = "\(quantity)"
        for (index,button) in locationButtons.enumerated() {
            if index == 0 {
                button.isSelected = true
                button.backgroundColor = .clear
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 2
                button.layer.borderColor = Colors.main.cgColor
                locationLabels[index].textColor = Colors.main
                
            } else {
                button.isSelected = false
                button.backgroundColor = .clear
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.clear.cgColor
                locationLabels[index].textColor = Colors.button
            }
        }
        
        for button in expButtons {
            
            button.isSelected = false
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = Colors.button.cgColor
            button.setTitleColor(Colors.button, for: .normal)
            
        }
        saveButton.titleLabel?.textColor = Colors.button
        favButton.isSelected = false
        
        purchaseDateTextfield.text = formatter.string(from: Date()).capitalized
        let currentDate = Date()
        expDateTextfield.text = formatter.string(from: Date()).capitalized
        datePicker1.setDate(currentDate, animated: false)
        datePicker2.setDate(currentDate, animated: false)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        guard let name = nameTextField.text else { return false }
        //guard let category = categoryTextfield.text else { return false }
        
        if name != ""  {
            DispatchQueue.main.async {
                self.saveButton.titleLabel?.textColor = Colors.main
                self.saveButton.isEnabled = true
            }
            
        }
        /*
         if let name = nameTextField.text , let category = categoryTextfield.text  {
         DispatchQueue.main.async {
         self.saveButton.titleLabel?.textColor = Colors.main
         }
         
         saveButton.isEnabled = true
         
         }
         */
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeTextField = textField
        if textField.tag == 1 {
            moveViewUp()
            tableView.isHidden = true
            purchaseDateTextfield.inputView = datePicker1
            datePicker1.datePickerMode = .date
            datePicker1.addTarget(self, action: #selector(self.datePickerChanged(sender:)) , for: .valueChanged)
            purchaseDateTextfield.text = formatter.string(from: datePicker1.date).capitalized
            moveViewDown()
        } else if textField.tag == 2 {
            moveViewUp()
            tableView.isHidden = true
            expDateTextfield.inputView = datePicker2
            datePicker2.datePickerMode = UIDatePickerMode.date
            datePicker2.addTarget(self, action: #selector(self.datePickerChanged(sender:)), for: .valueChanged)
            if let indexSelected = selectedExpIndex {
                expButtons[indexSelected].isSelected = false
            }
            for button in expButtons {
                
                button.backgroundColor = .clear
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                button.layer.borderColor = Colors.button.cgColor
                button.titleLabel?.textColor = Colors.button
                
            }
            expDateTextfield.text = formatter.string(from: datePicker2.date).capitalized
        } else if textField == categoryTextfield {
            moveViewDown()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        activeTextField?.resignFirstResponder()
        activeTextField?.endEditing(true)
        moveViewDown()
        
        if textField == nameTextField {
            tableView.isHidden = true
        }
        return true
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        
        if sender == datePicker1 {
            purchaseDate = sender.date
            purchaseDateTextfield.text = formatter.string(from: sender.date).capitalized
        } else if sender == datePicker2 {
            expDate = sender.date
            expDateTextfield.text = formatter.string(from: sender.date).capitalized
        }
    }
    
    func resetAddItems(){
        
        formatInitialData()
        saveButton.isEnabled = false
        
    }
    
    func moveViewUp() {
        if topMarginConstraint.constant != originalTopMargin {
            return
        }
        topMarginConstraint.constant -= 130
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func moveViewDown() {
        if topMarginConstraint.constant == originalTopMargin {
            return
        }
        topMarginConstraint.constant = originalTopMargin
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
    }
    
    
}
