const express = require("express");
const router = express.Router();
const db = require("./../db");
const md5 = require("md5");

// Change Password Route
router.post("/change-password", async (req, res) => {
  try {
    const { userId, currentPassword, newPassword } = req.body;
    const branch = req.query.branch || req.headers['x-branch-id'] || 'condet';

    // Validate input
    if (!userId || !currentPassword || !newPassword) {
      return res.status(400).json({
        success: false,
        message: "Semua field harus diisi",
      });
    }

    // Get database pool for the branch
    const dbPool = db.getPool(branch);

    // Get user from database
    const sql = "SELECT * FROM users WHERE id = ?";
    dbPool.query(sql, [userId], async (err, results) => {
      if (err) {
        console.error("Error fetching user:", err);
        return res.status(500).json({
          success: false,
          message: "Terjadi kesalahan saat mengambil data user",
        });
      }

      if (results.length === 0) {
        return res.status(404).json({
          success: false,
          message: "User tidak ditemukan",
        });
      }

      const user = results[0];

      // Verify current password
      const hashedCurrentPassword = md5(currentPassword);
      if (hashedCurrentPassword !== user.password) {
        return res.status(400).json({
          success: false,
          message: "Password saat ini tidak sesuai",
        });
      }

      // Hash new password
      const hashedNewPassword = md5(newPassword);

      // Update password
      const updateSql = "UPDATE users SET password = ? WHERE id = ?";
      dbPool.query(updateSql, [hashedNewPassword, userId], (updateErr) => {
        if (updateErr) {
          console.error("Error updating password:", updateErr);
          return res.status(500).json({
            success: false,
            message: "Terjadi kesalahan saat mengubah password",
          });
        }

        res.json({
          success: true,
          message: "Password berhasil diubah",
        });
      });
    });
  } catch (error) {
    console.error("Error changing password:", error);
    res.status(500).json({
      success: false,
      message: "Terjadi kesalahan saat mengubah password",
    });
  }
});

module.exports = router;
