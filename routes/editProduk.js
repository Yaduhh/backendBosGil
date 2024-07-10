const express = require("express");
const router = express.Router();
const db = require("../db");

router.put("/:id", (req, res) => {
  const id = req.params.id;
  const { name, detail, price, status } = req.body;

  const updateQuery =
    "UPDATE menu SET name = ?, detail = ?, price = ?, status = ? WHERE id = ?";
  db.query(updateQuery, [name, detail, price, status, id], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Error updating menu item");
    }
    res.status(200).send("Menu item updated successfully");
  });
});

module.exports = router;
