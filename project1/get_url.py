"""
Web scraper for URLs of mobile phones on https://www.mobilplus.sk/
This app looks for 150 (unique) mobile phones and prints their URLs for further processing.

Authors: xzvara01, xvlkja07
Date: 25/09/2024
"""

import requests
from bs4 import BeautifulSoup

def retrieve(url, max=150, items_per_page=22):
    URLs = []
    retrieved = 0
    page = 1

    while retrieved < max:
        if retrieved % items_per_page == 0:
            page += 1
        req = requests.get(url + str(page))
        soup = BeautifulSoup(req.text, "html.parser")

        # Products on this page are stored in divs with class product
        products = soup.find_all("div", class_="product")
        for product in products:
            if retrieved >= max:
                break
            link = product.find("a", class_="image").get("href")
            URLs.append(link)
            retrieved += 1

    return URLs

if __name__ == "__main__":
    BASE_URL = "https://www.mobilplus.sk"

    # 'f' URL parameter is used to display different pages of products
    for endpoint in retrieve(BASE_URL + "/mobilni-telefony/strana-"):
        print(BASE_URL + endpoint)