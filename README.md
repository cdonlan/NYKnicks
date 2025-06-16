# New York Knicks Hub

This is a static website for New York Knicks fans, built with [Hugo](https://gohugo.io/) and deployed to both GitHub Pages and Azure Static Web Apps.

## Features
- Team roster, schedule, and stats pages
- Modern, responsive design using the PaperMod or Ananke Hugo theme
- Automated CI/CD pipelines for deployment
- Playwright smoke tests for site validation

## Local Development
1. Clone the repository:
   ```sh
   git clone https://github.com/cdonlan/NYKnicks.git
   cd NYKnicks
   ```
2. Install [Hugo](https://gohugo.io/getting-started/installing/).
3. Serve the site locally:
   ```sh
   hugo server
   ```
4. Visit [http://localhost:1313/](http://localhost:1313/) in your browser.

## Testing
- Playwright Python scripts are in the `tests/` directory.
- To run smoke tests:
   ```sh
   pip install playwright
   playwright install
   python tests/test_smoke.py <site_url>
   ```

## Deployment
- GitHub Actions workflows build and deploy the site to both GitHub Pages and Azure Static Web Apps.
- The `public/` folder is generated at build time and is not committed to the repository.

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.
