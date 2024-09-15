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

public struct Time: Identifiable
{
    public var seconds:     Int
    public var description: String
    {
        let minutes = self.seconds / 60
        let seconds = self.seconds % 60

        let minutesLabel = minutes > 1 ? "minutes" : "minute"
        let secondsLabel = seconds > 1 ? "seconds" : "second"

        if minutes == 0
        {
            return "\( seconds ) \( secondsLabel )"
        }
        else if seconds == 0
        {
            return "\( minutes ) \( minutesLabel )"
        }
        else
        {
            return "\( minutes ) \( minutesLabel ) \( seconds ) \( secondsLabel )"
        }
    }

    public var id: String
    {
        self.description
    }

    public static let all: [ Time ] = [
        Time( seconds: 1 ),
        Time( seconds: 2 ),
        Time( seconds: 5 ),
        Time( seconds: 10 ),
        Time( seconds: 20 ),
        Time( seconds: 30 ),
        Time( seconds: 60 ),
        Time( seconds: 120 ),
        Time( seconds: 180 ),
        Time( seconds: 240 ),
        Time( seconds: 300 ),
    ]
}
