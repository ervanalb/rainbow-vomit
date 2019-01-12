import serial
import struct

ser = serial.Serial("/dev/ttyACM0")

def cobs_encode(data):
    output = b''
    data += b'\0'
    ptr = 0
    while ptr < len(data):
        next_zero = data.index(b'\0', ptr)
        if next_zero - ptr >= 254:
            output += b'\xFF' + data[ptr:ptr+254]
            ptr += 254
        else:
            output += bytearray((next_zero - ptr + 1,)) + data[ptr:next_zero]
            ptr = next_zero + 1
    return output

def send_command(cmd, data):
    ser.write(b'\0' + cobs_encode(bytes((cmd,)) + data) + b'\0')

CMD_FRAME = 0x00
CMD_LENGTHS = 0x01

def set_lengths(lengths):
    send_command(CMD_LENGTHS, struct.pack("8H", *lengths))

if __name__ == "__main__":
    set_lengths([12, 12, 0, 0, 0, 0, 12, 12])

    #import time
    #i = 255
    while True:
        #for i in range(256):
        f = b''
        for ch in range(4):
            color = [[255, 0, 0], [0, 255, 0], [0, 0, 255], [255, 255, 0]][ch]
            f += bytes(color * 4)
        print(f)
        send_command(CMD_FRAME, f)
