# playwright_site_up.py
# Standalone Playwright script to ensure a site is up
# Usage: python test/playwright_site_up.py <URL>

import sys
from playwright.sync_api import sync_playwright

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python test/playwright_site_up.py <URL>")
        sys.exit(1)
    base_url = sys.argv[1]
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        response = page.goto(base_url)
        if response is None:
            print(f"No response from {base_url}")
            sys.exit(1)
        if response.status != 200:
            print(f"Site {base_url} is not up. Status: {response.status}")
            sys.exit(1)
        print(f"Site {base_url} is up!")
        browser.close()
