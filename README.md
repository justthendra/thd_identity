# 🆔 thd_identity | Character Creation

A modern and intuitive character registration system for the QBCore framework. This resource handles the initial identity setup for players, ensuring all necessary metadata is collected in a visually pleasing and user-friendly manner.

![Version](https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge)
![Framework](https://img.shields.io/badge/Framework-QBCore-emerald?style=for-the-badge)

---

## ✨ Features

- **Streamlined Registration**: Easy-to-use form for First Name, Last Name, Birthdate, and Nationality.
- **Glassmorphic UI**: Consistent with the AstraV design language, featuring clean blurs and modern typography.
- **Data Validation**: Client-side and server-side checks to ensure valid identity information is entered.
- **Automatic Integration**: Seamlessly saves player data to the QBCore `players` table.
- **Identity Card System**: Generates a digital identity that is used across other resources.
- **Responsive Design**: Works perfectly at any screen resolution.

---

## 🎨 Design Philosophy

`thd_identity` is built to make character creation a pleasant experience:
- **Emerald Accents**: Highlights input fields and buttons with the signature green.
- **Clean Layout**: Minimalist form design to avoid overwhelming new players.
- **Feedback**: Instant visual feedback when fields are correctly or incorrectly filled.

---

## 🛠️ Requirements

- **QBCore Framework**
- **thd_multichar** (Recommended flow)

---

## 🚀 Installation

1. Drag the `thd_identity` folder into your `resources/[thd]` directory.
2. Add the following to your `server.cfg`:
   ```cfg
   ensure thd_identity
   ```
3. Ensure it is started *after* QBCore but *before* your multicharacter script if you have specific dependencies.

---

## ⚙️ Technical Details

- **Frontend**: Vanilla HTML/CSS/JS.
- **Backend**: Utilizes QBCore's built-in functions to update player information after the registration form is submitted.
- **Validation**: Includes regex-based validation for names and dates to prevent SQL injection or formatting errors.

---
