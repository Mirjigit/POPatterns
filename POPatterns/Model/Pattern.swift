//
//  Pattern.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import Foundation

struct Pattern: Identifiable {
    let id: Int
    let name: String
    let descriptions: String
    let imageName: String
    var isFavorite: Bool = false
}

struct PNLParameters {
    var entryPrice: Double
    var exitPrice: Double
    var sharesAmount: Int
    var feesPercentage: Double
}


let patterns = [
    Pattern(id: 1, name: "Head and shoulders",
            descriptions: """
Head and shoulders is a chart pattern in which a large peak has a slightly smaller peak on either side of it. Traders look at head and shoulders patterns to predict a bullish-to-bearish reversal.
            Typically, the first and third peak will be smaller than the second, but they will all fall back to the same level of support, otherwise known as the ‘neckline’. Once the third peak has fallen back to the level of support, it is likely that it will breakout into a bearish downtrend.
""", imageName: "head-n-shoulders"),
    Pattern(id: 2, name: "Double top", descriptions: """
            A double top is another pattern that traders use to highlight trend reversals. Typically, an asset’s price will experience a peak, before retracing back to a level of support. It will then climb up once more before reversing back more permanently against the prevailing trend.
            """, imageName: "double-top"),
    Pattern(id: 3, name: "Double bottom", descriptions: """
A double bottom chart pattern indicates a period of selling, causing an asset’s price to drop below a level of support. It will then rise to a level of resistance, before dropping again. Finally, the trend will reverse and begin an upward motion as the market becomes more bullish.
A double bottom is a bullish reversal pattern, because it signifies the end of a downtrend and a shift towards an uptrend.
""", imageName: "double-bottom"),
    Pattern(id: 4, name: "Rounding bottom", descriptions: """
A rounding bottom chart pattern can signify a continuation or a reversal. For instance, during an uptrend an asset’s price may fall back slightly before rising once more. This would be a bullish continuation.
An example of a bullish reversal rounding bottom – shown below – would be if an asset’s price was in a downward trend and a rounding bottom formed before the trend reversed and entered a bullish uptrend. Traders will seek to capitalize on this pattern by buying halfway around the bottom, at the low point, and capitalizing on the continuation once it breaks above a level of resistance.
""", imageName: "rounding-bottom"),
    Pattern(id: 5, name: "Cup and handle", descriptions: """
The cup and handle pattern is a bullish continuation pattern that is used to show a period of bearish market sentiment before the overall trend finally continues in a bullish motion. The cup appears similar to a rounding bottom chart pattern, and the handle is similar to a wedge pattern – which is explained in the next section.
Following the rounding bottom, the price of an asset will likely enter a temporary retracement, which is known as the handle because this retracement is confined to two parallel lines on the price graph. The asset will eventually reverse out of the handle and continue with the overall bullish trend.
""", imageName: "cup-and-handle"),
    Pattern(id: 6, name: "Wedges", descriptions: """
Wedges form as an asset’s price movements tighten between two sloping trend lines. There are two types of wedge: rising and falling.
A rising wedge is represented by a trend line caught between two upwardly slanted lines of support and resistance. In this case the line of support is steeper than the resistance line. This pattern generally signals that an asset’s price will eventually decline more permanently – which is demonstrated when it breaks through the support level. A falling wedge occurs between two downwardly sloping levels. In this case the line of resistance is steeper than the support. A falling wedge is usually indicative that an asset’s price will rise and break through the level of resistance, as shown in the example below. Both rising and falling wedges are reversal patterns, with rising wedges representing a bearish market and falling wedges being more typical of a bullish market.
""", imageName: "wedges"),
    Pattern(id: 7, name: "Pennant or flags", descriptions: """
Pennant patterns, or flags, are created after an asset experiences a period of upward movement, followed by a consolidation. Generally, there will be a significant increase during the early stages of the trend, before it enters into a series of smaller upward and downward movements. Pennants can be either bullish or bearish, and they can represent a continuation or a reversal. The above chart is an example of a bullish continuation. In this respect, pennants can be a form of bilateral pattern because they show either continuations or reversals.
While a pennant may seem similar to a wedge pattern or a triangle pattern – explained in the next sections – it is important to note that wedges are narrower than pennants or triangles. Also, wedges differ from pennants because a wedge is always ascending or descending, while a pennant is always horizontal.
""", imageName: "pennant-or-flags"),
    Pattern(id: 8, name: "Ascending triangle", descriptions: """
The ascending triangle is a bullish continuation pattern which signifies the continuation of an uptrend. Ascending triangles can be drawn onto charts by placing a horizontal line along the swing highs – the resistance – and then drawing an ascending trend line along the swing lows – the support. Ascending triangles often have two or more identical peak highs which allow for the horizontal line to be drawn. The trend line signifies the overall uptrend of the pattern, while the horizontal line indicates the historic level of resistance for that particular asset.
""", imageName: "ascending-triangle"),
    Pattern(id: 9, name: "Descending triangle", descriptions: """
In contrast, a descending triangle signifies a bearish continuation of a downtrend. Typically, a trader will enter a short position during a descending triangle in an attempt to profit from a falling market. Descending triangles generally shift lower and break through the support because they are indicative of a market dominated by sellers, meaning that successively lower peaks are likely to be prevalent and unlikely to reverse.
Descending triangles can be identified from a horizontal line of support and a downward-sloping line of resistance. Eventually, the trend will break through the support and the downtrend will continue.
""", imageName: "descending-triangle"),
    Pattern(id: 10, name: "Symmetrical triangle", descriptions: """
A rounding bottom chart pattern can signify a continuation or a reversal. For instance, during an uptrend an asset’s price may fall back slightly before rising once more. This would be a bullish continuation.
An example of a bullish reversal rounding bottom – shown below – would be if an asset’s price was in a downward trend and a rounding bottom formed before the trend reversed and entered a bullish uptrend. Traders will seek to capitalize on this pattern by buying halfway around the bottom, at the low point, and capitalizing on the continuation once it breaks above a level of resistance.
""", imageName: "symmetrical-triangle"),
        
]


