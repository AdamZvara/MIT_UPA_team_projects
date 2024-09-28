"""
Web scraper for URLs of mobile phones on https://www.mobilplus.sk/
This app looks for 150 (unique) mobile phones and prints their URLs for further processing.

Authors: xzvara01, xvlkja07
Date: 09/2024
"""

import requests
from bs4 import BeautifulSoup

def retrieve(url, max=150):
    URLs = []
    retrieved = 0
    page = 1

    while retrieved < max:
        # Go to next page if all products of this page have been scraped
        req = requests.get(url + str(page) + '/')
        soup = BeautifulSoup(req.text, "html.parser")
        # Products on this page are stored in divs with class product
        products_content = soup.find("div", class_="category-content-wrapper")
        products = products_content.find_all("div", class_="product")
        for product in products:
            if retrieved >= max:
                break
            link = product.find("a", class_="image").get("href")
            URLs.append(link)
            retrieved += 1
        page += 1

    return URLs

if __name__ == "__main__":
    BASE_URL = "https://www.mobilplus.sk"
    # Filter only modern brands, older phones don't have the parameters table for the next step
    FILTER = "/mobilni-telefony:google,honor,samsung,xiaomi,poco,realme,oppo,motorola,huawei,vivo,htc,oneplus"
    PAGE = "/strana-"

    # 'f' URL parameter is used to display different pages of products
    for endpoint in retrieve(BASE_URL + FILTER + PAGE):
        print(BASE_URL + endpoint)