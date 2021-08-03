//
//  Numbers+Extensions.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 21.07.2021.
//

import UIKit

extension Int {
	var int32: Int32 { return Int32(self) }
	var int64: Int64 { return Int64(self) }
	var double: Double { return Double(self) }
	var float: Float { return Float(self) }
	var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int32 {
	var int: Int { return Int(self) }
	var int64: Int64 { return Int64(self) }
	var double: Double { return Double(self) }
	var float: Float { return Float(self) }
	var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int64 {
	var int32: Int32 { return Int32(self) }
	var int: Int { return Int(self) }
	var double: Double { return Double(self) }
	var float: Float { return Float(self) }
	var cgFloat: CGFloat { return CGFloat(self) }
}

extension Double {
	var int32: Int32 { return Int32(self) }
	var int64: Int64 { return Int64(self) }
	var int: Int { return Int(self) }
	var float: Float { return Float(self) }
	var cgFloat: CGFloat { return CGFloat(self) }
}

extension Float {
	var int32: Int32 { return Int32(self) }
	var int64: Int64 { return Int64(self) }
	var int: Int { return Int(self) }
	var double: Double { return Double(self) }
	var cgFloat: CGFloat { return CGFloat(self) }
}

extension CGFloat {
	var int32: Int32 { return Int32(self) }
	var int64: Int64 { return Int64(self) }
	var int: Int { return Int(self) }
	var float: Float { return Float(self) }
	var double: Double { return Double(self) }
}
