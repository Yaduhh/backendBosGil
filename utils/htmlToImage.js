const puppeteer = require('puppeteer');

const convertHtmlToImage = async (htmlString, options = {}) => {
  let browser;
  try {
    browser = await puppeteer.launch({
      headless: true,
      args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const page = await browser.newPage();
    
    const defaultOptions = {
      width: 400,
      height: 'auto',
      backgroundColor: '#FFFFFF',
      format: 'jpeg',
      quality: 90
    };
    
    const finalOptions = { ...defaultOptions, ...options };
    
    // Set viewport
    await page.setViewport({
      width: finalOptions.width,
      height: finalOptions.height === 'auto' ? 800 : finalOptions.height,
      deviceScaleFactor: 2
    });
    
    // Create full HTML document
    const fullHtml = `
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            body {
              font-family: Arial, sans-serif;
              font-size: 14px;
              color: #000000;
              line-height: 1.2;
              margin: 0;
              padding: 10px;
              background-color: ${finalOptions.backgroundColor};
              width: ${finalOptions.width}px;
              max-width: ${finalOptions.width}px;
            }
            * {
              box-sizing: border-box;
            }
            img {
              max-width: 100%;
              height: auto;
            }
            table {
              width: 100%;
              border-collapse: collapse;
            }
            th, td {
              border: 1px solid #ddd;
              padding: 8px;
              text-align: left;
            }
            th {
              background-color: #f2f2f2;
            }
          </style>
        </head>
        <body>
          ${htmlString}
        </body>
      </html>
    `;
    
    await page.setContent(fullHtml);
    
    // Wait for content to load - using setTimeout instead of waitForTimeout
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Take screenshot
    const screenshotOptions = {
      type: finalOptions.format,
      quality: finalOptions.quality,
      fullPage: finalOptions.height === 'auto'
    };
    
    const imageBuffer = await page.screenshot(screenshotOptions);
    
    return imageBuffer;
  } catch (error) {
    console.error('Error converting HTML to image:', error);
    throw new Error(`Gagal mengkonversi HTML ke gambar: ${error.message}`);
  } finally {
    if (browser) {
      await browser.close();
    }
  }
};

module.exports = {
  convertHtmlToImage
};
