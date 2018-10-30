////
////  FileSystemManager.swift
////  TopComics
////
////  Created by Jessica Lewinter on 29/10/18.
////  Copyright © 2018 Jessica Lewinter. All rights reserved.
////
//
//import UIKit
//
//enum AppDirectories: String {
//    case Documents = "Documents"
//    case Inbox = "Inbox"
//    case Library = "Library"
//    case Temp = "tmp"
//}
//
//protocol AppDirectoryNames {
//    func documentsDirectoryURL() -> URL
//    func inboxDirectoryURL() -> URL
//    func libraryDirectoryURL() -> URL
//    func tempDirectoryURL() -> URL
//    func getURL(for directory: AppDirectories) -> URL
//    func buildFullPath(forFileName name: String, inDirectory directory: AppDirectories) -> URL
//}
//
//extension AppDirectoryNames{
//    func documentsDirectoryURL() -> URL {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    }
//    func inboxDirectoryURL() -> URL {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(AppDirectories.Inbox.rawValue)
//        
//    }
//    func libraryDirectoryURL() -> URL {
//        return FileManager.default.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: .userDomainMask).first!
//    }
//    func tempDirectoryURL() -> URL {
//        return FileManager.default.temporaryDirectory
//    }
//    func getURL(for directory: AppDirectories) -> URL {
//        switch directory {
//        case .Documents:
//            return documentsDirectoryURL()
//        case .Inbox:
//            return inboxDirectoryURL()
//        case .Library:
//            return libraryDirectoryURL()
//        case .Temp:
//            return tempDirectoryURL()
//        }
//    }
//    func buildFullPath(forFileName name: String, inDirectory directory: AppDirectories) -> URL {
//        return getURL(for: directory).appendingPathComponent(name)
//    }
//}
