import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello")

    @keyword
    def add_items_to_cart(self, product_list):
        products_title = self.selLib.get_webelements("css:.card-body b")
        i = 1
        for product_title in products_title:
            if product_title.text in product_list:
                self.selLib.click_button("(//button[@class='btn w-10 rounded'])[" + str(i) + "]")
                time.sleep(1)
            i += 1
