# AutoHotkey_Scripts

## GraphicLibrary
### HtmlInterface Class

The `HtmlInterface` class is a sophisticated module designed to facilitate the creation, management, and interaction with HTML content within an AutoHotkey GUI. It allows developers to easily embed HTML documents with corresponding CSS and JavaScript files.

**Features:**
- **Title Management:** Assigns a unique GUI identifier based on the provided title.
- **Dimensions & Positioning:** Customize the dimensions (width and height) and positioning (X and Y coordinates) of the interface.
- **Transparency Control:** Set the level of transparency for the GUI window.
- **Navigation Events:** Handle navigation events such as `BeforeNavigate2` for custom handling of navigation requests.

**Usage:**
First, ensure that the Hash library is included:

```ahk
#Include C:\Users\avons\Code\AutoHotkey_Scripts\Util\Hash.ahk
```

Then, create an instance of the HtmlInterface class:

```ahk
htmlInterface := new HtmlInterface("Title", "path/to/html", 1600, 800, 0, 0, 160, globalText, navigateFunction)
```

You can then use methods such as Show, Hide, and Destroy to control the GUI display, and customize the HTML, CSS, and JS files as needed.

**Requirements:**
HTML, CSS, and JS files must be located in the specified directory.
Hashing function (HashString) to generate the unique GUI identifier.
The HtmlInterface class offers a streamlined way to integrate rich HTML content within AutoHotkey applications, providing a cohesive and modular approach to user interface design.

You may adjust the paths, descriptions, and examples as per your specific requirements or project structure.

