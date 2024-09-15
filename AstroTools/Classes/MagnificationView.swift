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

import SwiftUI

public struct MagnificationView: View
{
    @State private var aperture:            Double = 0
    @State private var focalLength:         Double = 0
    @State private var eyepieceFocalLength: Double = 0
    @State private var eyepieceFieldOfView: Double = 0
    @State private var barlow:              Double = 0

    private var maximumMagnification: String
    {
        guard self.aperture > 0
        else
        {
            return "--"
        }

        return String( format: "%.02f", min( 350, 2.5 * self.aperture ) )
    }

    private var magnification: String
    {
        guard self.focalLength > 0, self.eyepieceFocalLength > 0
        else
        {
            return "--"
        }

        let magnification = self.barlow > 0 ? self.focalLength / ( self.eyepieceFocalLength / self.barlow ) : self.focalLength / self.eyepieceFocalLength

        return String( format: "%.02f", magnification )
    }

    private var fieldOfView: String
    {
        guard self.eyepieceFocalLength > 0, self.eyepieceFieldOfView > 0, self.focalLength > 0
        else
        {
            return "--"
        }

        return String( format: "%.02f°", self.eyepieceFieldOfView / ( self.focalLength / self.eyepieceFocalLength ) )
    }

    public var body: some View
    {
        VStack( alignment: .leading )
        {
            HStack
            {
                Image( systemName: "magnifyingglass" )
                Text( "Magnification" ).font( .title )
            }
            Grid( alignment: .leading )
            {
                GridRow
                {
                    Text( "Focal Length:" ).foregroundStyle( .secondary )
                    TextField( "", value: $focalLength, format: .number ).textFieldStyle( .roundedBorder )
                    TelescopeMenu()
                    {
                        self.focalLength = $0.focalLength
                        self.aperture    = $0.aperture
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Aperture:" ).foregroundStyle( .secondary )
                    TextField( "", value: $aperture, format: .number ).textFieldStyle( .roundedBorder )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Maximum Magnification:" ).foregroundStyle( .secondary )
                    Text( self.maximumMagnification )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Eyepiece Focal Length:" ).foregroundStyle( .secondary )
                    TextField( "", value: $eyepieceFocalLength, format: .number ).textFieldStyle( .roundedBorder )
                    EyepieceMenu()
                    {
                        self.eyepieceFocalLength = Double( $0.focalLength )
                        self.eyepieceFieldOfView = Double( $0.fieldOfView )
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Eyepiece Field of View:" ).foregroundStyle( .secondary )
                    TextField( "", value: $eyepieceFieldOfView, format: .number ).textFieldStyle( .roundedBorder )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Barlow:" ).foregroundStyle( .secondary )
                    TextField( "", value: $barlow, format: .number ).textFieldStyle( .roundedBorder )
                    BarlowMenu()
                    {
                        self.barlow = Double( $0.magnification )
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Magnification:" ).foregroundStyle( .secondary )
                    Text( self.magnification )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Field of View:" ).foregroundStyle( .secondary )
                    Text( self.fieldOfView )
                }
                .frame( minHeight: 20 )
            }
        }
    }
}

#Preview
{
    MagnificationView().padding()
}
