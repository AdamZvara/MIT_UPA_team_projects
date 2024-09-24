"""
Web scraper for URLs of mobile phones on https://www.mobilpc.sk/smartfony-c799/
This app looks for 150 mobile phones and prints their URLs for further processing.

Authors: xzvara01, xvlkja07
"""

import requests
from bs4 import BeautifulSoup

def retrieve(url, max=150):
    URLs = []
    retrieved = 0
    unique_retrieved = 0

    while unique_retrieved < max:
        req = requests.get(url + str(retrieved))
        soup = BeautifulSoup(req.text, "html.parser")

        # Products on this page are stored in divs with class ProductView
        products = soup.find_all("div", class_="ProductView")
        for product in products:
            if unique_retrieved >= max:
                break
            link = product.find("a", class_="image").get("href")
            # Parameters specify size of RAM and storage, we want to remove them
            core_url = "".join(link.split("?")[:-1])
            if core_url not in URLs:
                URLs.append(core_url)
                unique_retrieved += 1
            retrieved += 1

    return URLs

if __name__ == "__main__":
    # f parameter is used to display different pages of products
    BASE_URL = "https://www.mobilpc.sk/smartfony-c799/?f="

    for endpoint in retrieve(BASE_URL):
        print(BASE_URL[:-4] + endpoint)