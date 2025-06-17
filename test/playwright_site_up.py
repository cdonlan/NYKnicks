# playwright_site_up.py
# Generic Playwright test to ensure a site is up
# Usage: pytest --base-url=<URL> test/playwright_site_up.py

import pytest
from playwright.sync_api import sync_playwright

@pytest.mark.parametrize("base_url", [pytest.config.getoption("--base-url")])
def test_site_is_up(base_url):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        response = page.goto(base_url)
        assert response is not None, f"No response from {base_url}"
        assert response.status == 200, f"Site {base_url} is not up. Status: {response.status}"
        browser.close()
