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

public struct SamplingView: View
{
    public enum Seing
    {
        case exceptional
        case good
        case ok
        case poor
        case veryPoor
    }

    public enum Sampling
    {
        case over
        case good
        case under
    }

    public var seing:      Seing
    public var resolution: Double

    private var range: ( min: Double, max: Double )
    {
        switch self.seing
        {
            case .exceptional: return ( 0.00, 0.50 )
            case .good:        return ( 0.33, 1.00 )
            case .ok:          return ( 0.67, 2.00 )
            case .poor:        return ( 1.33, 2.50 )
            case .veryPoor:    return ( 1.67, Double.greatestFiniteMagnitude )
        }
    }

    private var sampling: Sampling
    {
        if self.resolution < self.range.min
        {
            return .over
        }
        else if self.resolution > self.range.max
        {
            return .under
        }
        else
        {
            return .good
        }
    }

    private var label: String
    {
        switch self.sampling
        {
            case .over:  return "Over-Sampled"
            case .good:  return "Good"
            case .under: return "Under-Sampled"
        }
    }

    private var description: String
    {
        if self.seing == .veryPoor
        {
            return String( format: "%.02f - ...", self.range.min )
        }
        else
        {
            return String( format: "%.02f - %.02f", self.range.min, self.range.max )
        }
    }

    private var icon: String
    {
        switch self.sampling
        {
            case .over:  return "arrow.up.circle.fill"
            case .good:  return "checkmark.circle.fill"
            case .under: return "arrow.down.circle.fill"
        }
    }

    private var color: Color
    {
        switch self.sampling
        {
            case .over:  return .orange
            case .good:  return .green
            case .under: return .orange
        }
    }

    public var body: some View
    {
        if self.resolution > 0
        {
            HStack( alignment: .center )
            {
                Image( systemName: self.icon ).foregroundColor( self.color )
                Text( self.label ).foregroundStyle( self.color )
                Text( self.description ).foregroundStyle( .secondary ).font( .footnote )
            }
        }
        else
        {
            Text( "--" )
        }
    }
}

#Preview
{
    VStack( alignment: .leading )
    {
        SamplingView( seing: .ok, resolution: 3.0 )
        SamplingView( seing: .ok, resolution: 1.5 )
        SamplingView( seing: .ok, resolution: 0.5 )
        SamplingView( seing: .ok, resolution: 0.0 )
    }
    .padding()
}
