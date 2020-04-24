import logging
import random
import time
from fluent import handler
import msgpack

from io import BytesIO

custom_format = {
  'host': '%(hostname)s',
  'where': '%(module)s.%(funcName)s',
  'type': '%(levelname)s',
  'stack_trace': '%(exc_text)s'
}


def overflow_handler(pending):
    unpacker = msgpack.Unpacker(BytesIO(pending))
    for unpacked in unpacker:
        print(unpacked)


logging.basicConfig(level=logging.INFO,)

l = logging.getLogger('fluent.test')
h = handler.FluentHandler('app.follow', host='localhost', port=24224, buffer_overflow_handler=overflow_handler)
formatter = handler.FluentRecordFormatter(custom_format)
h.setFormatter(formatter)
l.addHandler(h)


def main():

    while True:
        divisor = random.choice([0, 2])
        random_number = random.randint(1, 1000)
        try:
            logging.info(f"{random_number} divided by {divisor}.")
            quotient, remainder = divmod(random_number, divisor)
            if remainder != 0:
                logging.warning("There's a remainder.")
            else:
                logging.info("There's no remainder.")
        except ZeroDivisionError:
            logging.error("Zero division error.")

        time.sleep(5)


if __name__ == "__main__":
    main()
