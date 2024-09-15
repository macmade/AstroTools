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

public struct Eyepiece: Identifiable
{
    public var brand:       String
    public var name:        String
    public var focalLength: Int
    public var fieldOfView: Double

    public var id: String
    {
        "\( self.brand ).\( self.name ).\( self.focalLength )mm"
    }

    public static let all: [ Eyepiece ] = [
        Eyepiece( brand: "Celestron", name: "PLÖSSL",    focalLength: 13, fieldOfView: 52 ),
        Eyepiece( brand: "Celestron", name: "PLÖSSL",    focalLength: 40, fieldOfView: 43 ),
        Eyepiece( brand: "Celestron", name: "X-Cell LX", focalLength: 9,  fieldOfView: 60 ),
        Eyepiece( brand: "Celestron", name: "X-Cell LX", focalLength: 25, fieldOfView: 60 ),
    ]
}
