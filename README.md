# Intune Application Starter Pack

This repository contains a collection of Win32 application packages and their associated PowerShell scripts for deployment via Microsoft Intune. Each application folder includes `install.ps1` for silent installation and `detect.ps1` for detection on client devices.

---

## Contents

* **[Win32-App-Packages/](Win32-App-Packages/)**: This directory contains subfolders for individual applications.

    * **[Google-Chrome/](Win32-App-Packages/Google-Chrome/)**: Scripts for deploying Google Chrome (Enterprise MSI).
        * `install.ps1`: Handles the silent installation of Google Chrome.
        * `detect.ps1`: Detects whether Google Chrome is installed on the device.
    * **[Adobe-Acrobat-Reader/](Win32-App-Packages/Adobe-Acrobat-Reader/)**: Scripts for deploying Adobe Acrobat Reader.
        * `install.ps1`: Manages the silent installation of Adobe Acrobat Reader.
        * `detect.ps1`: Checks for the presence of Adobe Acrobat Reader.
    * **[Visual-Studio-Code/](Win32-App-Packages/Visual-Studio-Code/)**: Scripts for deploying Visual Studio Code.
        * `install.ps1`: Performs the silent installation of Visual Studio Code.
        * `detect.ps1`: Verifies the installation of Visual Studio Code.

---

## How to Use These Packages in Intune

1.  **Download the Installer:** Obtain the official silent installer (MSI or EXE) for the desired application. *Note: The installers themselves are not included here due to licensing and size constraints.*
2.  **Prepare the Win32 Content:** Use the [Microsoft Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool) to package the application installer along with the `install.ps1` and `detect.ps1` scripts into a `.intunewin` file.
    * **Source Folder:** Point the tool to the specific application folder (e.g., `Win32-App-Packages\Google-Chrome`).
    * **Setup File:** Specify the actual installer filename (e.g., `GoogleChromeStandaloneEnterprise.msi`).
3.  **Upload to Intune:**
    * Go to **Microsoft Intune Admin Center > Apps > Windows > Add**.
    * Select **"Windows app (Win32)"** and upload your `.intunewin` file.
    * **Program:**
        * **Install command:** `powershell.exe -ExecutionPolicy Bypass -File install.ps1`
        * **Uninstall command:** (Define your uninstall command, e.g., `msiexec.exe /x "{product_code}" /qn` or a separate uninstall script).
    * **Detection rules:** Select **"Use a custom script"** and upload your `detect.ps1`. Configure the script settings (e.g., run as 64-bit PowerShell).
    * **Requirements, Supersedence, Assignments:** Configure these as needed for your environment.

---

## Contributing

Feel free to fork this repository, add your own application packages, and submit pull requests!

---
