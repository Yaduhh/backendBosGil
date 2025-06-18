// controllers/akunController.js

exports.getAccounts = async (req, res) => {
  try {
    const query = "SELECT * FROM users WHERE branch = ?";
    req.db.query(query, [req.branch], (error, results) => {
      if (error) {
        console.error("Error fetching users:", error);
        return res.status(500).json({ 
          success: false,
          error: "Gagal mengambil data pengguna" 
        });
      }
      res.json({
        success: true,
        data: results
      });
    });
  } catch (error) {
    console.error("Error in getAccounts:", error);
    res.status(500).json({ 
      success: false,
      error: "Terjadi kesalahan saat mengambil data pengguna" 
    });
  }
};

exports.deleteAccount = async (req, res) => {
  const { id } = req.params;
  try {
    // Set cashier reference to NULL in orders table
    await req.db.query(
      "UPDATE orders SET cashier = NULL WHERE cashier = ? AND branch = ?", 
      [id, req.branch]
    );

    // Now delete the user
    await req.db.query(
      "DELETE FROM users WHERE id = ? AND branch = ?", 
      [id, req.branch]
    );
    
    res.status(200).json({
      success: true,
      message: "Akun berhasil dihapus"
    });
  } catch (error) {
    console.error("Error deleting account:", error);
    res.status(500).json({
      success: false,
      error: "Gagal menghapus akun"
    });
  }
};

exports.editAccount = async (req, res) => {
  const { id } = req.params;
  const { name, username, gender, role, status } = req.body;
  
  try {
    await req.db.query(
      "UPDATE users SET name = ?, username = ?, gender = ?, role = ?, status = ? WHERE id = ? AND branch = ?",
      [name, username, gender, role, status, id, req.branch]
    );
    
    res.status(200).json({
      success: true,
      message: "Akun berhasil diperbarui"
    });
  } catch (error) {
    console.error("Error updating account:", error);
    res.status(500).json({
      success: false,
      error: "Gagal memperbarui akun"
    });
  }
};
