// The MIT License (MIT)
//
// Copyright (c) 2014 Nate Lyman (https://github.com/natelyman/SwiftImageLoader)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

public class ImageLoader {

    var cache = NSCache<NSString, NSData>()

    public class var sharedLoader: ImageLoader {
        struct Static {
            static let instance: ImageLoader = ImageLoader()
        }
        return Static.instance
    }

    public func imageForUrl(urlString: String, completionHandler: @escaping (_ image: UIImage?, _ url: String) -> Void) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {
                return
            }
            var data: NSData?

            if let dataCache = self.cache.object(forKey: urlString as NSString) {
                data = dataCache as NSData

            } else {
                if URL(string: urlString) != nil {
                    data = NSData(contentsOf: URL(string: urlString)!)
                    if data != nil {
                        self.cache.setObject(data!, forKey: urlString as NSString)
                    }
                } else {
                    return
                }
            }

            if let goodData = data {
                let image = UIImage(data: goodData as Data)
                DispatchQueue.main.async {
                    completionHandler(image, urlString)
                }
                return
            }

            let downloadTask: URLSessionDataTask = URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { data, _, error in

                if error != nil {
                    completionHandler(nil, urlString)
                    return
                }

                if data != nil {
                    let image = UIImage(data: data!)
                    self.cache.setObject(data! as NSData, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        completionHandler(image, urlString)
                    }
                    return
                }
            })
            downloadTask.resume()
        }
    }
}
