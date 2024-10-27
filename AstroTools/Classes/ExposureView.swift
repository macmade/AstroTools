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

public struct ExposureView: View
{
    @State private var f1: Double = 0
    @State private var t1: Double = 0
    @State private var f2: Double = 0

    private var t2: ( value: Double, description: String )
    {
        guard self.t1 > 0, self.f1 > 0, self.f2 > 0
        else
        {
            return ( 0, "--" )
        }

        let t2 = self.t1 * ( self.f2 * self.f2 ) / ( self.f1 * self.f1 )
        
        if t2 > 60
        {
            return ( t2, String( format: "%.02f - %.02f minutes", t2, t2 / 60 ) )
        }

        return ( t2, String( format: "%.02f", t2 ) )
    }

    private var ratio: String
    {
        guard self.t1 > 0, self.t2.value > 0
        else
        {
            return "--"
        }

        return String( format: "%.02fx",  self.t2.value / self.t1 )
    }

    public var body: some View
    {
        VStack( alignment: .leading )
        {
            HStack
            {
                Image( systemName: "camera.fill" )
                Text( "Exposure Time Equivalence" ).font( .title )
            }
            Grid( alignment: .leading )
            {
                GridRow
                {
                    Text( "Focal Ratio 1:" ).foregroundStyle( .secondary )
                    TextField( "", value: $f1, format: .number ).textFieldStyle( .roundedBorder )
                    TelescopeMenu()
                    {
                        self.f1 = $0.focalRatio
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Exposure Time 1:" ).foregroundStyle( .secondary )
                    TextField( "", value: $t1, format: .number ).textFieldStyle( .roundedBorder )
                    TimeMenu()
                    {
                        self.t1 = Double( $0.seconds )
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Focal Ratio 2:" ).foregroundStyle( .secondary )
                    TextField( "", value: $f2, format: .number ).textFieldStyle( .roundedBorder )
                    TelescopeMenu()
                    {
                        self.f2 = $0.focalRatio
                    }
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Exposure Time 2:" ).foregroundStyle( .secondary )
                    Text( self.t2.description )
                }
                .frame( minHeight: 20 )
                GridRow
                {
                    Text( "Ratio:" ).foregroundStyle( .secondary )
                    Text( self.ratio )
                }
                .frame( minHeight: 20 )
            }
        }
    }
}

#Preview
{
    ExposureView().padding()
}
