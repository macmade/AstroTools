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

public struct HFRToArcSecondsView: View
{
    @State private var focalLength: Double = 0
    @State private var aperture:    Double = 0
    @State private var pixelSize:   Double = 0
    @State private var hfr:         Double = 0

    private var arcSecondsPerPixel: ( value: Double, description: String )
    {
        guard self.focalLength > 0, self.pixelSize > 0, self.hfr >= 0
        else
        {
            return ( 0, "--" )
        }

        let arcSeconds = ( 206.2648 * self.pixelSize ) / self.focalLength

        return ( arcSeconds, String( format: "%.02f", arcSeconds ) )
    }

    private var arcSeconds: String
    {
        guard self.focalLength > 0, self.pixelSize > 0, self.hfr >= 0
        else
        {
            return "--"
        }

        return String( format: "%.02f", ( ( 206.2648 * self.pixelSize ) / self.focalLength ) * self.hfr * 2 )
    }

    private var maxResolution: String
    {
        guard self.aperture > 0
        else
        {
            return "--"
        }

        return String( format: "%.02f", 116 / self.aperture )
    }

    public var body: some View
    {
        VStack( alignment: .leading )
        {
            HStack
            {
                Image( systemName: "star.leadinghalf.filled" )
                Text( "HFR to Arc Seconds" ).font( .title )
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
                    Text( "Max Resolution in Arc Seconds:" ).foregroundStyle( .secondary )
                    Text( self.maxResolution )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Pixel Size:" ).foregroundStyle( .secondary )
                    TextField( "", value: $pixelSize, format: .number ).textFieldStyle( .roundedBorder )
                    CameraMenu()
                    {
                        self.pixelSize = $0.pixelSize
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Arc Seconds per Pixel:" ).foregroundStyle( .secondary )
                    Text( self.arcSecondsPerPixel.description )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "HFR:" ).foregroundStyle( .secondary )
                    TextField( "", value: $hfr, format: .number ).textFieldStyle( .roundedBorder )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Star Diameter in Arc Seconds:" ).foregroundStyle( .secondary )
                    Text( self.arcSeconds )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Exceptional Seeing:" ).foregroundStyle( .secondary )
                    SamplingView( seing: .exceptional, resolution: self.arcSecondsPerPixel.value )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Good Seeing:" ).foregroundStyle( .secondary )
                    SamplingView( seing: .good, resolution: self.arcSecondsPerPixel.value )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "OK Seeing:" ).foregroundStyle( .secondary )
                    SamplingView( seing: .ok, resolution: self.arcSecondsPerPixel.value )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Poor Seeing:" ).foregroundStyle( .secondary )
                    SamplingView( seing: .poor, resolution: self.arcSecondsPerPixel.value )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Very Poor Seeing:" ).foregroundStyle( .secondary )
                    SamplingView( seing: .veryPoor, resolution: self.arcSecondsPerPixel.value )
                }
                .frame( minHeight: 20 )
            }
        }
    }
}

#Preview
{
    HFRToArcSecondsView().padding()
}
