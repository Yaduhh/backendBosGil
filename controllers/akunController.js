// controllers/akunController.js
const db = require("../db"); // Sesuaikan dengan konfigurasi koneksi database Anda

exports.getAccounts = async (req, res) => {
  const query = "SELECT * FROM users";
  db.query(query, (error, results) => {
    if (error) {
      console.error("Error fetching users:", error);
      res.status(500).json({ error: "Failed to fetch users" });
      return;
    }
    res.json(results);
  });
};

exports.deleteAccount = async (req, res) => {
  const { id } = req.params;
  try {
    // Set cashier reference to NULL in orders table
    await db.query("UPDATE orders SET cashier = NULL WHERE cashier = ?", [id]);

    // Now delete the user
    await db.query("DELETE FROM users WHERE id = ?", [id]);
    res.status(200).send("Account deleted successfully");
  } catch (error) {
    console.error("Error deleting account:", error);
    res.status(500).send("Internal Server Error");
  }
};

exports.editAccount = async (req, res) => {
  const { id } = req.params;
  const { name, username, gender, role, status } = req.body;
  try {
    await db.query(
      "UPDATE users SET name = ?, username = ?, gender = ?, role = ?, status = ? WHERE id = ?",
      [name, username, gender, role, status, id]
    );
    res.status(200).send("Account updated successfully");
  } catch (error) {
    console.error("Error updating account:", error);
    res.status(500).send("Internal Server Error");
  }
};
