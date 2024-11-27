# Caring Collection Task

This project demonstrates the implementation of a horizontally scrolling collection view with cells that align dynamically and adhere to layout margin rules, similar to the behavior seen in the App Store.

https://github.com/user-attachments/assets/e3b73443-cfe9-493c-9ef2-6ed5ec4c01c1


## Overview

The main goal of this project is to create a full-screen collection view with horizontally scrolling cells that behave in a smooth and user-friendly manner:

- **Single Row**: The collection displays cells in a single horizontal row.
- **Full-Screen Display**: The collection view occupies the entire screen.
- **Left Margin Alignment**: The leftmost cell that fully fits on the screen always aligns with the collection view's left layout margin.
- **Scroll Behavior**: 
  - When the user releases the scroll, the cells align automatically based on the rule above.
  - A strong swipe allows the collection to "fly" past a few cells before stopping at the appropriate alignment.

## Constraints and Rules

- **Custom Layout**: `UICollectionViewCompositionalLayout` is not allowed for this implementation.
- **Smooth Scrolling**: The collection's scrolling behavior mimics that of the App Store, providing a polished and intuitive user experience.
