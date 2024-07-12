const express = require("express");
const router = express.Router();
const db = require("../db");
const path = require("path");
const fs = require("fs");
const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "assets/images");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage: storage });

router.put("/:id", upload.single("picture"), (req, res) => {
  const id = req.params.id;
  const { name, detail, price, status } = req.body;
  const picture = req.file ? req.file.filename : null;

  // Find existing item to get the old picture
  const findQuery = "SELECT picture FROM menu WHERE id = ?";
  db.query(findQuery, [id], (findErr, findResult) => {
    if (findErr) {
      console.log(findErr);
      return res.status(500).send("Error finding menu item");
    }

    if (findResult.length === 0) {
      return res.status(404).send("Menu item not found");
    }

    const oldPicture = findResult[0].picture;

    // Update query
    const updateQuery = picture
      ? "UPDATE menu SET name = ?, detail = ?, price = ?, status = ?, picture = ? WHERE id = ?"
      : "UPDATE menu SET name = ?, detail = ?, price = ?, status = ? WHERE id = ?";

    const queryParams = picture
      ? [name, detail, price, status, picture, id]
      : [name, detail, price, status, id];

    db.query(updateQuery, queryParams, (updateErr, result) => {
      if (updateErr) {
        console.log(updateErr);
        return res.status(500).send("Error updating menu item");
      }

      // Delete old picture if a new one was uploaded
      if (picture && oldPicture) {
        const oldPicturePath = path.join(
          __dirname,
          "..",
          "assets",
          "images",
          oldPicture
        );
        fs.unlink(oldPicturePath, (unlinkErr) => {
          if (unlinkErr) {
            console.log("Failed to delete old picture:", unlinkErr);
          }
        });
      }

      res.status(200).send("Menu item updated successfully");
    });
  });
});

module.exports = router;
