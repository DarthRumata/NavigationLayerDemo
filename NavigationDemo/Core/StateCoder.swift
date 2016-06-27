
import Foundation

typealias RawValue = [String: AnyObject]

class StateCoder {

    let URL: NSURL
     init(URL: NSURL) {
        self.URL = URL
    }

     func encode(state: [String: AnyObject]) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(state)
      do {
        try data.writeToURL(URL, options: NSDataWritingOptions.DataWritingAtomic)
      } catch let error {
        print(error)
      }
    }

     func decode() -> [String: AnyObject]? {
        if let data = NSData(contentsOfURL: URL) {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String: AnyObject]
        }
        
        return nil
    }
    
    func removeEncodedState() {
        do {
            try NSFileManager.defaultManager().removeItemAtURL(URL)
        } catch {}
    }
    
    var hasEncodedState: Bool {
        return StateCoder.hasEncodedStateAtURL(URL)
    }
    
    class func hasEncodedStateAtURL(URL: NSURL) -> Bool {
        return URL.checkResourceIsReachableAndReturnError(nil)
    }
}

extension StateCoder {
    
    func encode<T: RawRepresentable where T.RawValue == [String: AnyObject]>(object: T) {
        encode(object.rawValue)
    }
    
    func decode<T: RawRepresentable where T.RawValue == [String: AnyObject]>() -> T? {
        if let rawValue = decode() {
            return T(rawValue: rawValue)
        }
        
        return nil
    }
}