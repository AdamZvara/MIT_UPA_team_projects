"""
Get parameters of mobile devices from https://www.mobilplus.sk/
website and print them as TLV (Type-Length-Value) encoded strings.

The URLs are loaded from stdin and must be separated by newlines.

Authors: xzvara01, xvlkja07
Date: 09/2024
"""

import requests, sys
from bs4 import BeautifulSoup

class Scraper:
    def load_data(self, url):
        """ Load data, scrape parameters and store them in instance """
        # Get the HTML content of the URL
        req = requests.get(url)
        self.soup = BeautifulSoup(req.text, "html.parser")
        self.loaded_data = [url]
        # Always load name and price
        for f in ["name", "price"]:
            self.loaded_data.append(getattr(self, f)())
        # The site usually has table with parameters of the phone, retrieve all headers from the table so we can look for them later
        try:
            self.table_headers = self.soup.find("div", class_="extended-description").find_all("span", class_="row-header-label")
        except AttributeError:
            self.loaded_data += [None] * 5
            return
        # Call all functions to get parameters of the phone
        data_fun = ["size", "battery", "procspeed", "backcamera", "os"]
        for f in data_fun:
            self.loaded_data.append(getattr(self, f)())

    def print_data(self):
        """ Print data in TSV format """
        for d in self.loaded_data:
            print(d, end='\t')
        print()

    def name(self):
        """ Return name of the phone """
        return self.soup.find("div", class_="p-detail-inner-header").find("h1").get_text().strip().split('\n')[0]

    def price(self):
        """ Return price of the phone (in EUR) """
        possible_price = self.soup.find("span", class_="price-final-holder parameter-dependent default-variant")
        # Sometimes price is stored at 2 different places
        if possible_price:
            price = possible_price.find("span")
        else:
            price = self.soup.find("span", class_="price-final-holder")
        return price.get_text().strip()[1:]

    def get_table_element(self, caption):
        """ Generic function to retrieve data from self.table_headers based on caption """
        for header in self.table_headers:
            if caption in header.get_text():
                return header.find_next("td").get_text().strip()

    def size(self):
        """ Return size of the phone """
        return self.get_table_element("Velikost displeje")

    def battery(self):
        """ Return battery capacity of the phone (in mAh) """
        return self.get_table_element("Kapacita baterie")

    def procspeed(self):
        """ Return processor speed of the phone (in GHz) """
        return self.get_table_element("Max. frekvence procesoru")

    def backcamera(self):
        """ Return processor name of the phone """
        return self.get_table_element("Zadní fotoaparát")

    def os(self):
        """ Return operating system version of the phone """
        return self.get_table_element("Technologie displeje")

if __name__ == "__main__":
    scraper = Scraper()
    # Read URLs from stdin until EOF
    for line in sys.stdin:
        scraper.load_data(line.strip())
        scraper.print_data()