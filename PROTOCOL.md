# Protocol
The LED strip driver enumerates as a virtual serial port.

## Packetizing
Each packet is COBS-encoded. An end-of-packet is denoted by a 0 byte (separator character.)
A 0 byte should also be sent at the beginning of a packet to set the system to a known state.
The device will not operate until a 0 byte is received
(so that operating systems that send AT commands at the beginning will not cause bad things to happen)

<table><tr>
 <td>0 byte (initialization)</td>
 <td>Command (COBS-encoded)</td>
 <td>0 byte (end of packet / start of next packet)</td>
 <td>Command (COBS-encoded)</td>
 <td>0 byte</td>
 <td>0 byte (empty packets are ignored)</td>
 <td>Command (COBS-encoded)</td>
 <td>0 byte</td>
 <td>etc</td>
</tr></table>

## Within a packet
The first byte indicates what command is being given. The remaining bytes are that command.

Command | Name    | Data                         | Description
--------|---------|------------------------------|-------------------------------
0x00    | Frame   | Up to 8192 24-bit RGB values | Write out a frame to the LEDs
0x01    | Lengths | Eight 16-bit length values   | Sets the length of each strip

### Frame command
This command is used to output to the LEDs.
The command looks like this (COBS encoding not shown):
<table><tr>
 <td>0x00 (Frame command)</td>
 <td>Channel 0 LED 0 byte 0</td>
 <td>Channel 0 LED 0 byte 1</td>
 <td>Channel 0 LED 0 byte 2</td>
 <td>Channel 0 LED 1 byte 0</td>
 <td>Channel 0 LED 1 byte 1</td>
 <td>Channel 0 LED 1 byte 2</td>
 <td>...</td>
 <td>Channel 0 LED (Channel 0 length - 1) byte 0</td>
 <td>Channel 0 LED (Channel 0 length - 1) byte 1</td>
 <td>Channel 0 LED (Channel 0 length - 1) byte 2</td>
 <td>Channel 1 LED 0 byte 0</td>
 <td>Channel 1 LED 0 byte 1</td>
 <td>Channel 1 LED 0 byte 2</td>
 <td>...</td>
 <td>Channel 7 LED (Channel 0 length - 1) byte 0</td>
 <td>Channel 7 LED (Channel 0 length - 1) byte 1</td>
 <td>Channel 7 LED (Channel 0 length - 1) byte 2</td>
</tr></table>

Lengths are set for each channel with the "Lengths" command.
On powerup, the default length is 1024 for every channel.

As soon as the end of packet is received, the board begins writing out the data. If the packet is short, only the LEDs given will be output.

The output is double-buffered, so reception of a new frame command can be started immediately while the previous frame is being output.
In this case, the second frame output may not begin immediately. USB communication will be stalled during this time period
to ensure that a third frame is not received until there is a place to put it. In this way, the device will self rate-limit to the
maximum achievable framerate.

Note that sending short packets may result in a shorter write time, which may be undesirable
if you are relying on the device throttling communication for timing your application.

### Lengths command
This command is used to set the length of each LED strip. The maximum length for each strip is 1024, 

The command looks like this (COBS encoding not shown):
<table><tr>
 <td>0x00 (Frame command)</td>
 <td>Channel 0 length LSB</td>
 <td>Channel 0 length MSB</td>
 <td>Channel 1 length LSB</td>
 <td>Channel 1 length MSB</td>
 <td>...</td>
 <td>Channel 7 length LSB</td>
 <td>Channel 7 length MSB</td>
</tr></table>

Note that the lengths are little-endian.

If the packet is short, some lengths will remain unchanged.

The default length is 1024 for each channel.
