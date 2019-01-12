import serial

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
    ser.write(b'\0' + bytes((cmd,)) + cobs_encode(data) + b'\0')

CMD_FRAME = 0x00
CMD_LENGTHS = 0x01

if __name__ == "__main__":
    import time
    #i = 255
    while True:
        for i in range(256):
            f = bytes([i, 0, 0] + [0, 0, 0] * 49)
            send_command(CMD_FRAME, f)
