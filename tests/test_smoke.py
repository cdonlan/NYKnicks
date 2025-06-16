from playwright.sync_api import sync_playwright

def test_homepage_loads(site_url):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto(site_url)
        assert "New York Knicks Hub" in page.title()
        browser.close()

if __name__ == "__main__":
    import sys
    url = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:1313/"
    test_homepage_loads(url)