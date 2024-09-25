"""
Get parameters of mobile devices from https://www.mobilpc.sk/smartfony-c799
website and print them as TLV (Type-Length-Value) encoded strings.

The URLs are loaded from stdin and must be separated by newlines.

Authors: xzvara01, xvlkja07
Date: 26/09/2024
"""

import requests, sys, re
from bs4 import BeautifulSoup

class Scraper:
    def load_data(self, url):
        """ Load data, scrape parameters and store them in instance """
        # Get the HTML content of the URL
        req = requests.get(url)
        self.soup = BeautifulSoup(req.text, "html.parser")
        # Call all functions to get parameters of the phone
        data_fun = ["name", "price", "size", "battery", "procspeed", "procname", "osversion"]
        self.data = [url]
        for df in data_fun:
            self.data.append(getattr(self, df)())

    def print_data(self):
        """ Print data in TLV format """
        for d in self.data:
            print(d, end='\t')
        print()

    def name(self):
        """ Return name of the phone """
        return self.soup.find("h1", class_="HeadingView").get_text()

    def price(self):
        """ Return price of the phone (in EUR) """
        return self.soup.find("meta", property="og:price:amount").get("content")

    def generic_td_elem(self, elem, text, split=True):
        """ Return value of generic element which contains some text """
        try:
            # Product parameters are stored in a table, find the right row and get the value
            value = self.soup.find(elem, string=text).find_next("td").get_text()
        except AttributeError:
            return None
        # Sometimes we need to split the value (e.g. to get only the dimension)
        return value.split()[0] if split else value

    def size(self):
        """ Return size of the phone """
        return self.generic_td_elem("span", "Uhlopriečka displeja")

    def battery(self):
        """ Return battery capacity of the phone (in mAh) """
        possible_bat = self.generic_td_elem("td", "Kapacita batérie")
        if possible_bat:
            return possible_bat
        # Sometimes the battery is freely in text, use regex to match it
        regexp = re.findall(r'\b\d\s\d+\s*mAh\b', self.soup.get_text())
        if regexp:
            return "".join(regexp[0].split()[:-1])

    def procspeed(self):
        """ Return processor speed of the phone (in GHz) """
        return self.generic_td_elem("td", "Rýchlosť procesora")

    def procname(self):
        """ Return processor name of the phone """
        possible_proc = self.generic_td_elem("td", "Označenie procesora")
        # Processor name is sometimes stored in a different element
        return possible_proc if possible_proc else self.generic_td_elem("td", "Značka procesora")

    def osversion(self):
        """ Return operating system version of the phone """
        return self.generic_td_elem("td", "Verzia operačného systému", False)

if __name__ == "__main__":
    scraper = Scraper()
    # Read URLs from stdin until EOF
    for line in sys.stdin:
        scraper.load_data(line.strip())
        scraper.print_data()