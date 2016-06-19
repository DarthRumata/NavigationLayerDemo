
import Foundation

private let appID = NSBundle.mainBundle().bundleIdentifier!

public struct PathBuilder {
	
	public let url: NSURL
	
	// MARK: - Init
	
	public init(identifier: String, directory: NSSearchPathDirectory) {
		url = PathBuilder.URLForDirectory(directory).URLByAppendingPathComponent(identifier, isDirectory: true)
	}
	
	init(directory: NSSearchPathDirectory) {
		url = PathBuilder.URLForDirectory(directory)
	}
	
	private init(url: NSURL) {
		self.url = url
	}
	
	public func appendingComponent(component: String, isDirectory: Bool = false) -> PathBuilder {
		return PathBuilder(url: url.URLByAppendingPathComponent(component, isDirectory: isDirectory))
	}
	
	// MARK: - Utility
	
	private static func URLForDirectory(directory: NSSearchPathDirectory) -> NSURL {
		let directoryPath = NSSearchPathForDirectoriesInDomains(directory, .UserDomainMask, true)[0]
		let directoryURL = NSURL(fileURLWithPath: directoryPath, isDirectory: true)
		
		return directoryURL.URLByAppendingPathComponent(appID, isDirectory: true)
	}
}
