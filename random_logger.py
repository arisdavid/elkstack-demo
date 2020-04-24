import logging
import random
import time

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s-%(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


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
