// controllers/akunController.js

const crypto = require("crypto");

exports.getAccounts = async (req, res) => {
  try {
    // Since each database is already separated by branch, we don't need branch column
    const query = "SELECT * FROM users";
    req.db.query(query, (error, results) => {
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

exports.registerAccount = async (req, res) => {
  const { name, username, password, role, gender, birthday, status } = req.body;

  console.log('Attempting to register account for branch:', req.branch);
  console.log('Register data:', { name, username, role, gender, birthday, status });

  try {
    const hashedPassword = crypto
      .createHash("md5")
      .update(password)
      .digest("hex");

    // Check if username already exists
    const checkUserQuery = "SELECT * FROM users WHERE username = ?";
    req.db.query(checkUserQuery, [username], (err, result) => {
      if (err) {
        console.error("Error checking existing user:", err);
        return res.status(500).json({ 
          success: false, 
          message: "Internal server error" 
        });
      }

      if (result.length > 0) {
        return res
          .status(400)
          .json({ success: false, message: "Username sudah terdaftar" });
      }
      
      const currentDate = new Date();
      // Insert new user (no need for branch column since database is already separated)
      const sql =
        "INSERT INTO users (name, username, password, role, gender, birthday, createdAt, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      req.db.query(
        sql,
        [
          name,
          username,
          hashedPassword,
          role,
          gender,
          birthday,
          currentDate,
          status
        ],
        (err, result) => {
          if (err) {
            console.error("Error inserting new user:", err);
            return res.status(500).json({ 
              success: false, 
              message: "Internal server error" 
            });
          }

          console.log('User registered successfully. Insert ID:', result.insertId);
          res.json({ 
            success: true, 
            message: "Registrasi berhasil",
            branch: req.branch
          });
        }
      );
    });
  } catch (error) {
    console.error("Error in registerAccount:", error);
    res.status(500).json({ 
      success: false, 
      message: "Internal server error" 
    });
  }
};

exports.deleteAccount = async (req, res) => {
  const { id } = req.params;
  console.log('Attempting to delete account with ID:', id, 'from branch:', req.branch);
  
  try {
    // First, update orders table to set cashier to NULL
    // Since each database is already separated by branch, we don't need branch column
    req.db.query(
      "UPDATE orders SET cashier = NULL WHERE cashier = ?", 
      [id],
      (updateError, updateResult) => {
        if (updateError) {
          console.error("Error updating orders:", updateError);
          // Don't return error, just log it and continue with user deletion
          console.log('Continuing with user deletion despite orders update error...');
        } else {
          console.log('Orders updated successfully, now deleting user...');
        }
        
        // Now delete the user (no need for branch column since database is already separated)
        req.db.query(
          "DELETE FROM users WHERE id = ?", 
          [id],
          (deleteError, deleteResult) => {
            if (deleteError) {
              console.error("Error deleting user:", deleteError);
              return res.status(500).json({
                success: false,
                error: "Gagal menghapus akun"
              });
            }
            
            if (deleteResult.affectedRows === 0) {
              console.log('No user found with ID:', id);
              return res.status(404).json({
                success: false,
                error: "Akun tidak ditemukan"
              });
            }
            
            console.log('User deleted successfully. Affected rows:', deleteResult.affectedRows);
            res.status(200).json({
              success: true,
              message: "Akun berhasil dihapus"
            });
          }
        );
      }
    );
  } catch (error) {
    console.error("Error in deleteAccount:", error);
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat menghapus akun"
    });
  }
};

exports.editAccount = async (req, res) => {
  const { id } = req.params;
  const { name, username, gender, role, status } = req.body;
  
  console.log('Attempting to edit account with ID:', id, 'from branch:', req.branch);
  console.log('Update data:', { name, username, gender, role, status });
  
  try {
    req.db.query(
      "UPDATE users SET name = ?, username = ?, gender = ?, role = ?, status = ? WHERE id = ?",
      [name, username, gender, role, status, id],
      (error, result) => {
        if (error) {
          console.error("Error updating account:", error);
          return res.status(500).json({
            success: false,
            error: "Gagal memperbarui akun"
          });
        }
        
        if (result.affectedRows === 0) {
          console.log('No user found with ID:', id);
          return res.status(404).json({
            success: false,
            error: "Akun tidak ditemukan"
          });
        }
        
        console.log('Account updated successfully. Affected rows:', result.affectedRows);
        res.status(200).json({
          success: true,
          message: "Akun berhasil diperbarui"
        });
      }
    );
  } catch (error) {
    console.error("Error in editAccount:", error);
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat memperbarui akun"
    });
  }
};
