//
//  Constants.swift
//  Keep
//
//  Created by Luna An on 12/22/16.
//  Copyright © 2016 Mimicatcodes. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

struct Colors {
    static let duckEggBlue = UIColor.rgb(229, 253, 249, 1)
    static let lightTeal = UIColor.rgb(133, 219, 205, 1)
    static let lightTealTwo = UIColor.rgb(178, 231, 222, 1)
    static let lightTealThree = UIColor.rgb(135, 219, 206, 1)

    static let tealish =  UIColor.rgb(35, 213, 185, 1)
    static let tealishFaded = UIColor.rgb(35, 213, 185, 0.3)
    
    static let whiteTwo = UIColor.rgb(245, 245, 245, 1)
    static let whiteThree = UIColor.rgb(219, 219, 219, 1)
    static let whiteFour = UIColor.rgb(229, 229, 229, 1)
    static let whiteFive = UIColor.rgb(213, 213, 213, 1)
    static let whiteSix = UIColor.rgb(242, 242, 242, 1)

    static let warmGrey = UIColor.rgb(131, 131, 131, 1)
    static let warmGreyTwo = UIColor.rgb(146, 146, 146, 1)
    static let warmGreyThree = UIColor.rgb(113, 113, 113, 1)
    static let warmGreyFour = UIColor.rgb(123, 123, 123, 1)
    static let warmGreyFive = UIColor.rgb(151, 151, 151, 1)

    static let greyishBrown = UIColor.rgb(77, 77, 77, 1)
    static let brownishGrey = UIColor.rgb(96, 96, 96, 1)
    static let brownishGreyTwo = UIColor.rgb(100, 100, 100, 1)
    static let brownishGreyThree = UIColor.rgb(94, 94, 94, 1)
    
    static let pastelRed = UIColor.rgb(237, 93, 93, 1)
    static let salmon = UIColor.rgb(249, 117, 102, 1)
    static let peachyPink = UIColor.rgb(255, 137, 137, 1)

    static let pinkishGrey = UIColor.rgb(202, 202, 202, 1)
    static let pinkishGreyTwo = UIColor.rgb(201, 201, 201, 1)
    
    static let dawn = UIColor.rgb(0, 0, 0, 0.10)
    }

struct Keys {
    static let searchField = "searchField"
    static let placeholderLabel = "placeholderLabel"
    static let name = "name"
    static let category = "category"
    static let title = "title"
    static let exp = "exp"
    static let location = "location"
    
    struct UserDefaults {
        static let hour = "hour"
        static let minute = "minute"
        static let onboardingComplete = "onboardingComplete"
    }
}

struct NotificationName {
    static let refreshTableview = NSNotification.Name("RefeshTVNotification")
    static let refreshItemList = NSNotification.Name("RefreshItemListNotification")
    static let refreshFavorites = NSNotification.Name("RefreshFavorites")
    static let refreshScannedItems = NSNotification.Name("RefreshScannedItems")
    static let refreshMainTV = NSNotification.Name("RefreshMainTV")
    static let refreshCharts = NSNotification.Name("RefreshCharts")
}

struct Identifiers {
    struct Cell {
        static let stockCell = "stockCell"
        static let shoppingListCell = "shoppingListCell"
        static let listDetailCell = "listDetailCell"
        static let accountCell = "accountCell"
        static let scannedItemCell = "scannedItemCell"
        static let searchCell = "searchCell"
        static let favoriteCell = "favoriteCell"
        static let nameCell = "nameCell"
        static let settingExpiresCell = "settingExpiresCell"
    }
    struct Segue {
        static let toScannedItems = "toScannedItems"
        static let addScannedItem = "addScannedItem"
        static let addList = "addList"
        static let showItems = "showItems"
        static let addItemToSL = "addItemToSL"
        static let editIems = "editItems"
        static let unwindToMain = "unwindToMain"
        static let favToStock = "favToStock"
        static let moveToStock = "moveListItemToStock"
        static let setReminder = "setReminder"
        static let showExpires = "showExpires"
    }
    
    struct Storyboard {
        static let main = "Main"
        static let onboarding = "Onboarding"
        static let mainApp = "MainApp"
    }
}

struct Locations {
    static let fridge = Location.Fridge.rawValue
    static let freezer = Location.Freezer.rawValue
    static let pantry = Location.Pantry.rawValue
    static let other = Location.Other.rawValue
}

struct Fonts {
    static let montserratRegular = "Montserrat-Regular"
    static let montserratSemiBold = "Montserrat-SemiBold"
    static let latoRegular = "Lato-Regular"
    static let latoSemibold = "Lato-Semibold"
}

struct TesseractLang {
    static let english = "eng"
}

struct Filters {
    static let category = "category == %@"
    static let uniqueID = "uniqueID contains[c] %@"
    static let listUniqueID = "list.uniqueID contains[c] %@"
    static let name = "name contains[c] %@"
    static let isExpiring = "isExpiring == true AND isExpired == false"
    static let isExpiringToday = "isExpiringToday == true AND isExpired == false"
    static let isExpired = "isExpired == true"
    static let fridge = "location == 'Fridge'"
    static let freezer = "location == 'Freezer'"
    static let pantry = "location == 'Pantry'"
    static let other = "location == 'Other'"
    
    static let vegetables = "category == 'Vegetables'"
    static let fruits = "category == 'Fruits'"
    static let grainsPasta = "category CONTAINS[c] 'Pastas'"
    static let grainsOther = "category CONTAINS[c] 'Grains'"
    static let proteinMeats = "category CONTAINS[c] 'Meats'"
    static let proteinBeans = "category CONTAINS[c] 'Beans'"
    static let proteinNuts = "category CONTAINS[c] 'Nuts'"
    static let dairy = "category == 'Dairy'"
    static let charSet = "01234567890.,"
}

struct EmptyString {
    static let none = ""
}

struct Labels {
    static let lineBreak = "\n"
    static let na = "N/A"
    static let done = "Done"
    static let cancel = "Cancel"
    static let expired = "Expired!"
    static let expiring = "Expiring soon"
    static let expiringInThreeDays = "Expiring in 3 days"
    static let expiringToday = "Expiring today"
    static let expiringTodayCap = "Expiring Today"
    static let expiredItems = "Expired Items"
    static let expiringItems = "Expiring Items"
    static let expiredOn = "Expires on "
    static let xQuantity = "x "
    static let dayLeft = " day left"
    static let daysLeft = " days left"
    static let addedOn = "Added on "
    static let purchasedOn = "Purchased on "
    static let itemEdited = "Item has been edited"
    static let itemAdded = "Item has been added"
    
    static let singular = "item in stock"
    static let plural = "items in stock"
    static let signularExpiring = "item is expiring"
    static let pluralExpiring = "items are expiring"
    
    static let itemIs = "Item is"
    static let ItemsAre = "Items are"
    
    static let item = "item"
    static let items = "items"
    
}

struct OnBoarding {
    static let checkListTitle = "Stay Organized"
    static let checkListBody =
    "Manage your foods easily.\r\nAdd and move items to Stock.\r\nMake a shopping list to shop efficiently."
    static let piggyBankTitle = "Save Money"
    static let piggyBankBody = "Reduce your food waste.\r\nKnow when your foods are about to expire."
    static let produceTitle = "Be Healthy"
    static let produceBody = "Know your shopping trends.\r\nLearn to buy healthier items."
}

struct emptyState {
    static let main = "No items here yet!"
    static let shoppingList = "No shopping lists yet!"
    static let fav = "No favorites yet!"
    static let listItem = "No items in this list yet!"
    static let search = "No matching items found"
    static let expiringItems = "No expiring items found."
    static let messageForItems = "Tap ' + ' to add items"
    static let messageForSL = "Tap ' + ' to add a shopping list"
    static let messageForFav = "Tap ' + ' to add your favorite items"
}

struct LocalNotification {
    static let title = "SPOILER ALERT!"
    static let subtitleSingular = " item is expiring today"
    static let subtitlePlural = " items are expiring today"
    static let bodySingular = "Use it today before it goes bad."
    static let bodyPlular = "Make sure to use them today."
    static let categoryIdentifier = "reminder"
    static let messageforNoNeed = "no notification needed - no expiring items today"
}

struct DateFormat {
    static let monthDayYear = "MMM dd, yyyy"
    static let time = "hh:mm a"
    static let doubleDigitTime = "%02d"
    
}
struct FoodGroups {
    static let categories = [FiveFoodGroups.Vegetables.rawValue, FiveFoodGroups.Fruits.rawValue, FiveFoodGroups.Grains.rawValue, FiveFoodGroups.Dairy.rawValue, FiveFoodGroups.Protein.rawValue]
    static let groceryCategories:[FoodCategories] = [.other, .vegetables, .fruits, .pastasAndNoodles, .otherGrains, .dairy, .meatsSeafoodsAndEggs, .condimentsAndSauce, .beansPeasAndTofu, .nutsAndSeeds, .beverages, .alcoholicBeverages, .healthAndPersonalCare, .householdAndCleaning ]
}

struct FoodItems {
    static let all  = [vegetables, fruits, pastaAndNoodles, otherGrains, dairy, meatsSeafoodsAndEggs, beansPeasAndTofu, nutsAndSeeds, beverages, alcoholicBeverages, condimentsAndSauce, healthAndPersonalCare, householdAndCleaning]
}

struct SearchPlaceholder {
    static let search =  "Search                                                            "
}

struct AlertForSL {
    static let title = "Are you sure you want to delete this list?"
    static let message = "All items in the list will be deleted."
    static let delete = "Delete"
    static let cancel = "Cancel"
}

struct ImageName {
    static let clear = "Clear"
    static let delete1 = "Delete1"
    static let delete2 = "Delete2"
    static let editGrey1 = "EditGrey1"
    static let editGrey2 = "EditGrey2"
    static let back = "Back"
}

struct Email {
    static let address = "trykeepapp@gmail.com"
    static let subject = "Hi Keep Team!"
    static let failedMessage = "Unable to send an email"
    static let noMail = "No Mail Accounts!"
    static let unableToEmailMessage = "Unable to send email due to no Mail accounts set up. Please email directly us at trykeepapp@gmail.com\r\nThank you!"
    static let ok = "OK"
}

struct AppID {
    static let ituensAddress = "https://itunes.apple.com/us/app/"
    static let appID = "keep-simple-grocery-tracker-and-shopping-list/id1214634700?ls=1&mt=8"
}

enum FiveFoodGroups: String {
    case Protein
    case Dairy
    case Vegetables
    case Fruits
    case Grains
}

enum SettingExpire: String {
    case expired, today, threeDays
}

enum Location : String {
    case Fridge, Freezer, Pantry, Other
}

enum SettingMenu : String {
    case reminder = "Set Reminder"
    case sendFeedback = "Send Feedback"
    case rateUs = "Rate Us on the App Store"
}

extension UIImage {
    enum Asset: String {
        case checkList = "checkList"
        case checkListWithBorder = "bullet1"
        case piggyBank = "piggyBank"
        case piggyBankWithBorder = "bullet2"
        case produce = "produce"
        case produceWithBorder = "bullet3"
        //case circle = "circle"
        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}

enum FoodCategories : String {
    
    // MARK: vegetables
    case vegetables = "Vegetables"
    
    // MARK: Fruits
    case fruits = "Fruits"
    
    // MARK: Grain
    case pastasAndNoodles = "Pastas and Noodles"
    case otherGrains = "Other Grains"
    
    // MARK: Dairy
    case dairy = "Dairy"
    
    // MARK: Protein
    case meatsSeafoodsAndEggs = "Meats, Seafoods, and Eggs"
    case beansPeasAndTofu = "Beans, Peas and Tofu"
    case nutsAndSeeds = "Nuts and Seeds"
    
    // MARK: Other
    case beverages = "Beverages"
    case alcoholicBeverages = "Alcoholic Beverages"
    case condimentsAndSauce = "Condiments and Sauce"
    case healthAndPersonalCare = "Health and Personal Care"
    case householdAndCleaning = "Household and Cleaning"
    case other = "Other"
}


