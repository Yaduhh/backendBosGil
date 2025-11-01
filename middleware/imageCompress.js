// middleware/imageCompress.js
const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

/**
 * Middleware untuk compress dan resize image berdasarkan query parameter
 * Support: ?w=400&q=75 (width dan quality)
 */
const imageCompress = async (req, res, next) => {
  // Cek apakah ini request untuk assets dengan query parameter w atau q
  if (!req.path.startsWith('/assets/')) {
    return next();
  }

  const { w, q } = req.query;
  
  // Jika tidak ada query parameter untuk resize/compress, skip
  if (!w && !q) {
    return next();
  }

  try {
    // Extract branch dan filename dari path
    // Path format: /assets/condet/image.jpg
    const pathParts = req.path.split('/');
    if (pathParts.length < 3) {
      return next();
    }

    const branch = pathParts[2];
    const filename = pathParts.slice(3).join('/');
    const imagePath = path.join(__dirname, '..', 'assets', branch, filename);

    // Cek apakah file exist
    if (!fs.existsSync(imagePath)) {
      return next();
    }

    // Parse query parameters
    const width = w ? parseInt(w) : null;
    const quality = q ? Math.min(Math.max(parseInt(q), 1), 100) : 80; // Default 80, clamp 1-100

    // Check if file is an image
    const ext = path.extname(filename).toLowerCase();
    const imageExtensions = ['.jpg', '.jpeg', '.png', '.webp', '.gif'];
    if (!imageExtensions.includes(ext)) {
      return next();
    }

    // Process image dengan sharp
    let image = sharp(imagePath);

    // Resize jika ada parameter w
    if (width && width > 0) {
      image = image.resize(width, null, {
        withoutEnlargement: true, // Jangan enlarge jika image lebih kecil
        fit: 'inside' // Maintain aspect ratio
      });
    }

    // Set quality/compress dan determine content type
    let contentType;
    // PNG tidak support quality parameter, convert ke JPEG dengan quality untuk compression
    if (ext === '.jpg' || ext === '.jpeg') {
      image = image.jpeg({ quality });
      contentType = 'image/jpeg';
    } else if (ext === '.png') {
      // PNG tidak support quality, convert ke JPEG dengan quality untuk compression
      image = image.jpeg({ quality });
      contentType = 'image/jpeg';
    } else if (ext === '.webp') {
      image = image.webp({ quality });
      contentType = 'image/webp';
    } else {
      contentType = `image/${ext.slice(1)}`;
    }

    // Set response headers
    res.set({
      'Content-Type': contentType,
      'Cache-Control': 'public, max-age=31536000', // Cache 1 year
    });

    // Stream processed image
    return image.pipe(res);

  } catch (error) {
    console.error('Image compression error:', error);
    // Jika error, fallback ke original file
    return next();
  }
};

module.exports = imageCompress;

