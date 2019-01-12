import serial
import struct
import time

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
    data = b'\0' + cobs_encode(bytes((cmd,)) + data) + b'\0'
    for i in range(100):
        t1 = time.time()
        ser.write(data)
        t2 = time.time()
        print("datalen:", len(data))
        print("FPS:", 1 / (t2 - t1))
        print("kilobits per sec:", 8 * len(data) / (t2 - t1) / 1000)
        print("target kbps:", 800 * 8)

CMD_FRAME = 0x00
CMD_LENGTHS = 0x01

def set_lengths(lengths):
    send_command(CMD_LENGTHS, struct.pack("8H", *lengths))

if __name__ == "__main__":
    #set_lengths([12, 12, 0, 0, 0, 0, 12, 12])
    l = 1024 * 3
    #set_lengths([l, l, 0, 0, 0, 0, l, l])
    set_lengths([l, l, l, l, l, l, l, l])

    import time
    #i = 255
    #rainbow = [255, 0, 0, 255, 255, 0, 0, 255, 0, 0, 255, 255, 0, 0, 255, 255, 0, 255]
    #full_rainbow = (rainbow * (l // len(rainbow) + 1))[0:l]
    while True:
        for i in range(50):
            b = [0] * l
            b[i * 3] = 255
            b[i * 3 + 1] = 255
            b[i * 3 + 2] = 255
            send_command(CMD_FRAME, bytes(b * 8))
            #time.sleep(0.1)
