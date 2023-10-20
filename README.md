# 🚀 Neovim Config Migration Script 🚀

This script simplifies the process of migrating your Neovim configuration files to the standard `$HOME/.config/nvim` directory. It works on macOS, Linux, and even reminds you how much we hate Windows.

## How to Use

1. **Download the Script:**

   You can download the script by copying its contents from your browser or using the following commands:

   ```bash
    git clone https://github.com/tristonarmstrong/neo-triston.git
   ```

2. **Run the Script:**

   To run the script, navigate to the directory where your Neovim configuration files are located (the git clone) and use the following command:

   ```bash
    chmod +x install.sh && ./install.sh
   ```

3. **Purge Existing Configuration (Optional):**

   You can use the `-p` flag to purge your existing Neovim configuration in `$HOME/.config/nvim` before moving your files. This is useful if you want to start with a clean slate:

   ```bash
   ./install.sh -p
   ```

4. **Check Your New Neovim Configuration:**

   After running the script, your Neovim configuration files will be located in `$HOME/.config/nvim`.

   ![MindBlown](https://media2.giphy.com/media/26ufdipQqU2lhNA4g/giphy.gif)

5. **Enjoy Neovim!**

   🚀 Start using Neovim with your migrated configuration.

---
