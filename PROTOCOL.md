# Protocol
The LED strip driver enumerates as a virtual serial port.

Each frame consists of a 16-byte chunk of metadata, followed by the pixel data. The metadata must be sent every frame, and contains the length for each channel.
The lengths are little-endian and are in bytes, so multiply the number of RGB pixels you have by 3.

Metadata format:

<table>
 <tr><td>Channel 0 length LSB</td></tr>
 <tr><td>Channel 0 length MSB</td></tr>
 <tr><td>Channel 1 length LSB</td></tr>
 <tr><td>Channel 1 length MSB</td></tr>
 <tr><td>...</td></tr>
 <tr><td>Channel 7 length LSB</td></tr>
 <tr><td>Channel 7 length MSB</td></tr>
</table>

Immediately following the metadata is the pixel data in the following format:

<table>
 <tr><td>Channel 0 byte 0 *(e.g. LED 0 Red)*</td></tr>
 <tr><td>Channel 0 byte 1 *(e.g. LED 0 Green)*</td></tr>
 <tr><td>Channel 0 byte 2 *(e.g. LED 0 Blue)*</td></tr>
 <tr><td>Channel 0 byte 3 *(e.g. LED 1 Red)*</td></tr>
 <tr><td>Channel 0 byte 4 *(e.g. LED 1 Green)*</td></tr>
 <tr><td>Channel 0 byte 5 *(e.g. LED 1 Blue)*</td></tr>
 <tr><td>...</td></tr>
 <tr><td>Channel 0 byte (Channel 0 length - 3)</td></tr>
 <tr><td>Channel 0 byte (Channel 0 length - 2)</td></tr>
 <tr><td>Channel 0 byte (Channel 0 length - 1)</td></tr>
 <tr><td>Channel 1 byte 0</td></tr>
 <tr><td>Channel 1 byte 1</td></tr>
 <tr><td>Channel 1 byte 2</td></tr>
 <tr><td>...</td></tr>
 <tr><td>Channel 7 byte (Channel 0 length - 1)</td></tr>
 <tr><td>Channel 7 byte (Channel 0 length - 1)</td></tr>
 <tr><td>Channel 7 byte (Channel 0 length - 1)</td></tr>
</table>

Once the predetermined amount of data has been received,
the frame will begin to be written out to the LED strips.

If the protocol gets out of sync, simply frob any control line of the serial port, for example, RTS. Closing and re-opening the serial port should also work.

## Frame buffers
The output is double-buffered, so reception of a new frame command can be started immediately while the previous frame is being output.
If data reception of the second frame finishes before the first frame is done being output, the device will pause to allow output to finish. USB communication will be stalled during this time period
to ensure that a third frame is not received until there is a place to put it. In this way, the device will self rate-limit to the
maximum achievable framerate.

Each frame buffer has a maximum size of **24576 bytes**. You may split these bytes however you wish amongst the eight channels.
For instance, you could put them all towards channel 0 in which case you could drive 8192 24-bit RGB LEDs, but would be limited to about 4 frames per second.
Or, you could use 1024 pixels per channel, which would allow you to run at 30 FPS. Requesting more than the maximum number of bytes will result in undefined behavior.
