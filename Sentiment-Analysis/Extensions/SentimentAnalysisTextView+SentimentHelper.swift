//
//  SentimentAnalysisTextView+SentimentHelper.swift
//  Created by Kyle Weiner on 2/4/16.
//

import UIKit
import SwiftyJSON

extension SentimentAnalysisTextView {
    /// Updates the view with the `SentimentType` and analyzed text response.
    func update(with sentiment: SentimentType, response: JSON) {
        // Hides the view, processes the text and then shows the view.
        UIView.animate(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState, .curveEaseOut], animations: {
            [unowned self] in
            self.alpha = 0
        }) {
            [unowned self] finished in
            self.normalizeText()
            self.highlightTextWithResponse(response)
            self.tintColor = sentiment.color

            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                self.alpha = 1
            }, completion: nil)
        }
    }

    /// Normalizes the text (e.g. removes highlights and resets foreground color)
    func normalizeText() {
        textColor = defaultTextColor

        let normalizedText = NSMutableAttributedString(attributedString: attributedText)
        let range = (text as NSString).range(of: text)
        normalizedText.removeAttribute(NSAttributedString.Key.backgroundColor, range: range)

        attributedText = normalizedText
    }

    /// Highlights the "positive" and "negative" text from the response.
    func highlightTextWithResponse(_ response: JSON) {
        let highlightedText = NSMutableAttributedString(attributedString: attributedText)

        if let positiveElements = response["positive"].array {
            for element in positiveElements {
                guard let elementText = element["original_text"].string else {
                    continue
                }

                highlightedText.addAttribute(NSAttributedString.Key.foregroundColor,
                    value: UIColor.white,
                    range: (text as NSString).range(of: elementText)
                )

                highlightedText.addAttribute(NSAttributedString.Key.backgroundColor,
                    value: AppColor.positive,
                    range: (text as NSString).range(of: elementText)
                )
            }
        }

        if let negativeElements = response["negative"].array {
            for element in negativeElements {
                guard let elementText = element["original_text"].string else {
                    continue
                }

                highlightedText.addAttribute(NSAttributedString.Key.foregroundColor,
                    value: UIColor.white,
                    range: (text as NSString).range(of: elementText)
                )

                highlightedText.addAttribute(NSAttributedString.Key.backgroundColor,
                    value: AppColor.negative,
                    range: (text as NSString).range(of: elementText)
                )
            }
        }
        
        self.attributedText = highlightedText
    }
}
