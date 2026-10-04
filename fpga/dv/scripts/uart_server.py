import argparse
import sys
import serial
from serial.tools import list_ports
import time




def main():
    p = argparse.ArgumentParser(description="UART serial reader")
    p.add_argument("port", nargs="?", help="e.g. COM5 (Windows) or /dev/ttyUSB1 (Linux)")
    p.add_argument("-b", "--baud", type=int, default=115200)
    p.add_argument("--hex", action="store_true", help="print raw bytes as hex")
    p.add_argument("-o", "--out", help="also log raw bytes to this file")
    args = p.parse_args()

    if not args.port:
        print("Available ports:")
        for port in list_ports.comports():
            print(f"  {port.device:12} {port.description}")
        sys.exit(0)

    log = open(args.out, "wb") if args.out else None

    prev = time.time()

    # 8N1, no flow control: the usual setup for a simple FPGA UART
    with serial.Serial(
        args.port,
        baudrate=args.baud,
        bytesize=serial.EIGHTBITS,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        timeout=0.1,
    ) as ser:
        print(f"Listening on {ser.port} @ {args.baud} baud (Ctrl+C to quit)")
        try:
            while True:
                if(( time.time() - prev) > 2):
                    ser.write(b"Sent\n")
                    prev = time.time()
                data = ser.read(ser.in_waiting or 1)
                if not data:
                    continue
                if log:
                    log.write(data)
                    log.flush()
                if args.hex:
                    print(" ".join(f"{b:02x}" for b in data), flush=True)
                else:
                    sys.stdout.write(data.decode("ascii", errors="replace"))
                    sys.stdout.flush()
        except KeyboardInterrupt:
            print("\nStopped.")
        finally:
            if log:
                log.close()



if __name__ == "__main__":
    main()