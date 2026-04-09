import time
import logging
import random

logging.basicConfig(
    filename='logs/app.log',
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s'
)

messages = ["User login", "Payment success", "Error processing request"]

while True:
    msg = random.choice(messages)
    if "Error" in msg:
        logging.error(msg)
    else:
        logging.info(msg)
    time.sleep(2)