import time
import logging
import random

# Configure logging
logging.basicConfig(
    filename='logs/app.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

levels = ["INFO", "WARNING", "ERROR"]

while True:
    level = random.choice(levels)

    if level == "INFO":
        logging.info("This is an INFO log")
    elif level == "WARNING":
        logging.warning("This is a WARNING log")
    else:
        logging.error("This is an ERROR log")

    print(f"Generated {level} log")
    time.sleep(2)