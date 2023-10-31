//
//  coreModelController.swift
//  coredata_self_programming
//
//  Created by 최영호 on 10/19/23.
//

import Foundation
import CoreData

class CoreDataController : ObservableObject{
    let container = NSPersistentContainer(name: "coreModel")
    
    init(){
        container.loadPersistentStores { desc, Error in
            if let Error = Error{
                print("Failed to load\(Error.localizedDescription)")
            }
        }
    }
    
    func save(context : NSManagedObjectContext){
        do{
            try context.save()
            
        }catch{
            
        }
    }
    
    func add_user(age : Double, name : String, context : NSManagedObjectContext){
        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.age = age
        
        save(context: context)
    }
    
    func edit_user(user : User, age : Double, name : String, context : NSManagedObjectContext){
        
        user.name = name
        user.age = age
        save(context: context)
    }
    
}
