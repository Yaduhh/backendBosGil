const express = require("express");
const router = express.Router();
const { getPool } = require("../db");
const path = require("path");
const fs = require("fs");

// Get branch from request header
const getBranchFromHeader = (req) => {
  const branch = req.headers["x-branch-id"] || "condet";
  return branch.toLowerCase();
};

// Delete menu
router.delete("/:id", (req, res) => {
  const { id } = req.params;
  const branch = getBranchFromHeader(req);
  const pool = getPool(branch);

  console.log("Deleting menu with ID:", id);
  console.log("Branch:", branch);

  // First get the menu to get the picture filename
  pool.query("SELECT * FROM menu WHERE id = ?", [id], (err, result) => {
    if (err) {
      console.log("Database error:", err);
      return res.status(500).send("Error finding menu");
    }

    if (result.length === 0) {
      return res.status(404).send("Menu not found");
    }

    const menu = result[0];
    console.log("Found menu:", menu);

    // Delete the menu from database
    pool.query("DELETE FROM menu WHERE id = ?", [id], (err, result) => {
      if (err) {
        console.log("Delete error:", err);
        return res.status(500).send("Error deleting menu");
      }

      // If menu had a picture, delete it from the branch folder
      if (menu.picture) {
        // Construct the correct path for the branch folder
        const branchPath = path.join(__dirname, "..", "assets", branch);
        const picturePath = path.join(branchPath, menu.picture);
        
        console.log("Attempting to delete image from:", picturePath);

        try {
          if (fs.existsSync(picturePath)) {
            fs.unlinkSync(picturePath);
            console.log("Successfully deleted image:", picturePath);
          } else {
            console.log("Image file not found at:", picturePath);
          }
        } catch (err) {
          console.log("Error deleting image:", err);
        }
      }

      res.status(200).json({
        success: true,
        message: "Menu deleted successfully"
      });
    });
  });
});

module.exports = router;
