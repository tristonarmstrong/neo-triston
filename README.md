# 🚀 Neo-Triston Neovim Config 🚀
I created this Repository because I tend to switch things up a lot, using different operating systems and starting fresh all the time. This will come in handy, unless im on windows cause...... windows

## The Install Script
This script simplifies the process of migrating your Neovim configuration files to the standard `$HOME/.config/nvim` directory. It works on macOS, Linux, and even reminds you how much we hate Windows.
> [!NOTE]
> youll notice theres a ton of comments in the scripts.. Thats mostly for me for future reference as well as for learning purposes

## How to Use

1. **Clone the Repository:**

   You can clone the repo by using the following commands or downloading the zip:

   ```bash
    git clone https://github.com/tristonarmstrong/neo-triston.git
   ```

2. **Run the Script:**

   To run the script, navigate to the directory where your Neovim configuration files are located (the git clone) and use the following command:

   ```bash
    chmod +x install.sh && ./install.sh
   ```

3. **Command Line Arguments:**

   > [!NOTE]
   > these arguments are not allowed to be used together
    
   - **Purge Existing Configuration (Optional):**
        You can use the `-p` flag to purge your existing Neovim configuration in `$HOME/.config/nvim` before moving your files. This is useful if you want to start with a clean slate.
      ```bash
      ./install.sh -p
      ```
    - **Backup Current Configuration (Optional):**
        You can use the `-b` flag to create a backup of your current nvim directory within the nvim directory. The new backup will be called `nvim.bak`. This is useful if you want to NOT completely irradicate your current config.
      ```bash
      ./install.sh -b
      ```

4. **Check Your New Neovim Configuration:**

   After running the script, your Neovim configuration files will be located in `$HOME/.config/nvim`.

   ![MindBlown](https://media2.giphy.com/media/26ufdipQqU2lhNA4g/giphy.gif)

5. **Enjoy Neovim!**

   🚀 Start using Neovim with your migrated configuration.

---
