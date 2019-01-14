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

OUTPUT_CHANNEL_COUNT = 8

def packetize(data):
    assert len(data) <= OUTPUT_CHANNEL_COUNT
    if len(data) < OUTPUT_CHANNEL_COUNT:
        data += [b""] * (OUTPUT_CHANNEL_COUNT - len(data))
    metadata = struct.pack("{}H".format(OUTPUT_CHANNEL_COUNT), *[len(ch_data) for ch_data in data])
    bytedata = b"".join([bytes(ch_data) for ch_data in data])
    return metadata + bytedata

def send(data):
    t1 = time.time()
    N = 1
    for i in range(N):
        ser.write(data)
    t2 = time.time()
    print("datalen:", len(data))
    print("FPS:", N * 1 / (t2 - t1))
    print("kilobits per sec:", N * 8 * len(data) / (t2 - t1) / 1000)
    print("target kbps:", 800 * 8)

CMD_FRAME = 0x00
CMD_LENGTHS = 0x01

if __name__ == "__main__":
    import time
    #i = 255
    #rainbow = [255, 0, 0, 255, 255, 0, 0, 255, 0, 0, 255, 255, 0, 0, 255, 255, 0, 255]
    #full_rainbow = (rainbow * (l // len(rainbow) + 1))[0:l]i

    l = 1024 * 3

    while True:
        for i in range(50):
            b = [0] * l
            b[i * 3] = 255
            b[i * 3 + 1] = 255
            b[i * 3 + 2] = 255
            send(packetize([b, b, b, b, b, b, b, b]))
            #time.sleep(0.1)
