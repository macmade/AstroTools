/*******************************************************************************
 * The MIT License (MIT)
 *
 * Copyright (c) 2023, Jean-David Gadina - www.xs-labs.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the Software), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

import Foundation

public struct Telescope: Identifiable
{
    public var brand:       String
    public var name:        String
    public var aperture:    Double
    public var focalLength: Double

    public var focalRatio: Double
    {
        self.focalLength / self.aperture
    }

    public var id: String
    {
        "\( self.brand ).\( self.name )"
    }

    public static let all: [ Telescope ] = [
        Telescope( brand: "Celestron", name: "NexStar Evolution 6",                       aperture: 150, focalLength: 1500 ),
        Telescope( brand: "Celestron", name: "NexStar Evolution 6 + 0.63 Reducer",        aperture: 150, focalLength: 1500 * 0.63 ),
        Telescope( brand: "Celestron", name: "NexStar Evolution 6 + Starizona HyperStar", aperture: 150, focalLength: 300 ),
        Telescope( brand: "Lunt",      name: "60mm Universal Telescope",                  aperture: 60,  focalLength: 420 ),
    ]
}
