//
//  ContentView.swift
//  TitikJumpaAdmin
//
//  Created by Ihwan ID on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import SwiftUI
import CloudKit


let color = Color(red: 1.0/255.0, green: 23.0/255.0, blue: 52.0/255.0, opacity: 1.0)
struct ContentView: View {
    @EnvironmentObject var listevents: ListEvent
    @State var menuOpen: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    var container: String = "iCloud.titikjumpa"
    
    
    func selectImage(){
        let myFiledialog = NSOpenPanel()
        myFiledialog.prompt = "Select path"
        myFiledialog.worksWhenModal = true
        myFiledialog.canChooseDirectories = false
        myFiledialog.canChooseFiles = true
        myFiledialog.allowedFileTypes = ["png", "jpg", "jpeg"]
        myFiledialog.allowsMultipleSelection = false
    }
    
    var body: some View {
        NavigationView{
                VStack{
                            Text("Silakan scan untuk kehadiran anda")
                            QRCodeView(url: "mc3")
            }
            
        }
//                List(listevents.events) { item in
//                    HStack(spacing: 15) {
//                        Text(item.name)
//                    }
//
//                }
            
//
//            VStack{
//
//                VStack {
//                    WelcomeText()
//                    UserImage()
//                    TextField("Username", text: $username)
//                        .padding()
//                        .background(color)
//                        .cornerRadius(5.0)
//                        .padding(.bottom, 20)
//                    SecureField("Password", text: $password)
//                        .padding()
//                        .background(color)
//                        .cornerRadius(5.0)
//                        .padding(.bottom, 20)
//                    Button(action: {print("Button tapped")}) {
//                       LoginButtonContent()
//                    }
//                }
//                .padding()
//                Button("Reload"){
//                    self.selectImage()
//                    self.listevents.events.removeAll()
//                    self.fetchData()
//                }
//                Button("Add") {
//                    let openPanel = NSOpenPanel()
//                    openPanel.prompt = "Select File"
//                    openPanel.allowsMultipleSelection = false
//                        openPanel.canChooseDirectories = false
//                        openPanel.canCreateDirectories = false
//                        openPanel.canChooseFiles = true
//                        openPanel.allowedFileTypes = ["png","jpg","jpeg"]
//                        openPanel.begin { (result) -> Void in
//                            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
//                                let selectedPath: URL = openPanel.url!.absoluteURL
//                                print(selectedPath)
//                                self.AddEvent(url: selectedPath)
//                            }
//                        }
//
//                }
//
//            }
//        }.onAppear{
//            self.fetchData()
//        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
//
//
            
        
    }
    
    
    
    func AddEvent(url: URL){
        var event = Event(id: UUID(), recordID: CKRecord.ID(), name: "Peduli Edukasi", location: "Sungai Beduk", total_vol: 100, points: 100, start_date: NSDate() as Date, end_date: NSDate() as Date, qrcode: "xxx123" )
        
        let image = NSImage(named: NSImage.Name("Logo Sign"))
        
        let itemRecord = CKRecord(recordType: "Event")
        itemRecord["name"] = event.name as CKRecordValue
        itemRecord["location"] = event.location as CKRecordValue
        itemRecord["total_vol"] = event.total_vol as CKRecordValue
        itemRecord["points"] = event.points as CKRecordValue
        itemRecord["start_date"] = event.start_date as CKRecordValue
        itemRecord["end_date"] = event.end_date as CKRecordValue
        itemRecord["qrcode"] = event.qrcode as CKRecordValue
//        itemRecord["photo"] = CKAsset(fileURL: url)
        CKContainer(identifier: self.container).publicCloudDatabase.save(itemRecord) { (record, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("error \(err)")
                    return
                }
                print("success")
                self.listevents.events.insert(event, at: 0)
            }
        }
        
        
        
    }
    
    func fetchData(){
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: "Event", predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                print(record["name"]!)
                let recordID = record.recordID
                guard let name = record["name"] as? String else {return}
                guard let date = record["date"] as? Date else {return}
                guard let location = record["location"] as? String else {return}
                guard let total_vol = record["total_vol"] as? Int else {return}
                guard let points = record["points"] as? Int else {return}
                guard let start_time = record["start_date"] as? Date else {return}
                guard let end_time = record["end_date"] as? Date else {return}
                guard let qrcode = record["qrcode"] as? String else {return}
               // self.listevents.events.append(Event(recordID: recordID, name: name, date: date, location: location, total_vol: total_vol, points: points, start_time: start_time, end_time: end_time, qrcode: qrcode))
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                if let err = error {
                    print("error \(error)")
                    return
                }
                
            }
            
        }
        
        CKContainer(identifier: self.container).publicCloudDatabase.add(operation)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText : View {
    var body: some View {
        return Text("Welcome to Titik Jumpa!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 100, height: 20)
            //.background(Color.blue)
            .cornerRadius(40.0)
    }
}

        // @State var menuOpen: Bool = false
        //
        //    var body: some View {
        //        ZStack {
        //            if !self.menuOpen {
        //                Button(action: {
        //                    self.openMenu()
        //                }, label: {
        //                    Text("Open")
        //                })
        //            }
        //
        //            SideMenu(width: 270,
        //                     isOpen: self.menuOpen,
        //                     menuClose: self.openMenu)
        //        }
        //    }
        //
        //    func openMenu() {
        //        self.menuOpen.toggle()
        //    }
        //}
